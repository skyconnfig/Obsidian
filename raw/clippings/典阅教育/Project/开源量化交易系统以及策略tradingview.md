# 开源量化交易系统以及策略tradingview

[https://github.com/khscience/OSkhQuant](https://github.com/khscience/OSkhQuant)

[https://github.com/vnpy/vnpy](https://github.com/vnpy/vnpy)

[https://www.tradingview.com/scripts/search/scalping/](https://www.tradingview.com/scripts/search/scalping/)

# <font style="color:rgb(15, 17, 21);">A股布林带振荡器头皮交易策略实战指南</font>
```plain
import numpy as np
import pandas as pd
import akshare as ak
import talib
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime, timedelta
import warnings
warnings.filterwarnings('ignore')

plt.rcParams['font.sans-serif'] = ['SimHei']  # 用来正常显示中文标签
plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号

class AShareBollingerStrategy:
    def __init__(self, stock_code='sh000001', 
                 start_date='20230101', 
                 end_date=None,
                 bb_period=20, 
                 bb_std=2.0, 
                 fast_ema_period=3,
                 ao_fast_period=5, 
                 ao_slow_period=34,
                 squeeze_percentage=20,
                 stop_loss_pct=2.0,
                 trade_start_time="09:30", 
                 trade_end_time="14:55"):
        """
        A股布林带振荡器交易策略
        
        参数:
        stock_code: 股票代码，默认上证指数
        start_date: 开始日期
        end_date: 结束日期，默认今天
        bb_period: 布林带周期
        bb_std: 布林带标准差倍数
        fast_ema_period: 快速EMA周期
        ao_fast_period: AO指标快线周期
        ao_slow_period: AO指标慢线周期
        squeeze_percentage: 窄幅百分比阈值
        stop_loss_pct: 止损百分比
        trade_start_time: 交易开始时间
        trade_end_time: 交易结束时间
        """
        self.stock_code = stock_code
        self.start_date = start_date
        self.end_date = end_date or datetime.now().strftime('%Y%m%d')
        self.bb_period = bb_period
        self.bb_std = bb_std
        self.fast_ema_period = fast_ema_period
        self.ao_fast_period = ao_fast_period
        self.ao_slow_period = ao_slow_period
        self.squeeze_percentage = squeeze_percentage
        self.stop_loss_pct = stop_loss_pct
        self.trade_start_time = trade_start_time
        self.trade_end_time = trade_end_time
        
        # 获取数据
        self.get_data()
        
        # 计算指标
        self.calculate_indicators()
        
        # 生成交易信号
        self.generate_signals()
        
        # 执行回测
        self.backtest()
    
    def get_data(self):
        """获取A股数据"""
        try:
            if self.stock_code.startswith('sh') or self.stock_code.startswith('sz'):
                # 获取指数数据
                stock_data = ak.stock_zh_index_daily(symbol=self.stock_code)
            else:
                # 获取个股数据
                stock_data = ak.stock_zh_a_hist(symbol=self.stock_code, 
                                               start_date=self.start_date, 
                                               end_date=self.end_date, 
                                               adjust="qfq")
            
            # 数据预处理
            stock_data['date'] = pd.to_datetime(stock_data['date'])
            stock_data.set_index('date', inplace=True)
            stock_data.sort_index(inplace=True)
            
            # 重命名列以符合标准OHLC格式
            if 'close' not in stock_data.columns:
                if '收盘' in stock_data.columns:
                    stock_data.rename(columns={'收盘': 'close'}, inplace=True)
                elif '收盘价' in stock_data.columns:
                    stock_data.rename(columns={'收盘价': 'close'}, inplace=True)
            
            if 'open' not in stock_data.columns:
                if '开盘' in stock_data.columns:
                    stock_data.rename(columns={'开盘': 'open'}, inplace=True)
                elif '开盘价' in stock_data.columns:
                    stock_data.rename(columns={'开盘价': 'open'}, inplace=True)
            
            if 'high' not in stock_data.columns:
                if '高' in stock_data.columns:
                    stock_data.rename(columns={'高': 'high'}, inplace=True)
                elif '最高价' in stock_data.columns:
                    stock_data.rename(columns={'最高价': 'high'}, inplace=True)
            
            if 'low' not in stock_data.columns:
                if '低' in stock_data.columns:
                    stock_data.rename(columns={'低': 'low'}, inplace=True)
                elif '最低价' in stock_data.columns:
                    stock_data.rename(columns={'最低价': 'low'}, inplace=True)
            
            if 'volume' not in stock_data.columns:
                if '成交量' in stock_data.columns:
                    stock_data.rename(columns={'成交量': 'volume'}, inplace=True)
            
            self.data = stock_data[['open', 'high', 'low', 'close', 'volume']].copy()
            print(f"成功获取 {self.stock_code} 从 {self.start_date} 到 {self.end_date} 的数据")
            
        except Exception as e:
            print(f"获取数据失败: {e}")
            # 使用模拟数据作为备用方案
            self.generate_sample_data()
    
    def generate_sample_data(self):
        """生成样本数据"""
        print("使用模拟数据进行演示")
        dates = pd.date_range(start=self.start_date, end=self.end_date, freq='D')
        np.random.seed(42)
        n = len(dates)
        price = 100 + np.cumsum(np.random.randn(n) * 0.5)
        
        self.data = pd.DataFrame({
            'open': price + np.random.randn(n) * 0.1,
            'high': price + np.random.randn(n) * 0.1 + 0.3,
            'low': price + np.random.randn(n) * 0.1 - 0.3,
            'close': price,
            'volume': np.random.randint(1000, 10000, n)
        }, index=dates)
    
    def calculate_indicators(self):
        """计算技术指标"""
        # 布林带
        self.data['bb_middle'] = talib.SMA(self.data['close'], timeperiod=self.bb_period)
        self.data['bb_std'] = talib.STDDEV(self.data['close'], timeperiod=self.bb_period)
        self.data['bb_upper'] = self.data['bb_middle'] + self.data['bb_std'] * self.bb_std
        self.data['bb_lower'] = self.data['bb_middle'] - self.data['bb_std'] * self.bb_std
        
        # 布林带宽度
        self.data['bb_width'] = (self.data['bb_upper'] - self.data['bb_lower']) / self.data['bb_middle']
        self.data['bb_width_avg'] = talib.SMA(self.data['bb_width'], timeperiod=self.bb_period)
        
        # 快速EMA
        self.data['fast_ema'] = talib.EMA(self.data['close'], timeperiod=self.fast_ema_period)
        
        # 动量振荡指标(AO)
        self.data['median'] = (self.data['high'] + self.data['low']) / 2
        self.data['ao'] = talib.SMA(self.data['median'], timeperiod=self.ao_fast_period) - \
                         talib.SMA(self.data['median'], timeperiod=self.ao_slow_period)
        self.data['ao_prev'] = self.data['ao'].shift(1)
        
        # AO动量方向
        self.data['ao_bullish'] = (self.data['ao'] > 0) & (self.data['ao'] > self.data['ao_prev'])
        self.data['ao_bearish'] = (self.data['ao'] < 0) & (self.data['ao'] < self.data['ao_prev'])
        
        # 布林带窄幅判断
        self.data['squeeze'] = self.data['bb_width'] < (self.data['bb_width_avg'] * (1 - self.squeeze_percentage/100))
        
        # 交易时间判断 (A股交易时间: 9:30-11:30, 13:00-15:00)
        self.data['hour'] = self.data.index.hour
        self.data['minute'] = self.data.index.minute
        self.data['in_trade_time'] = (
            ((self.data['hour'] == 9) & (self.data['minute'] >= 30)) |
            (self.data['hour'] >= 10) & (self.data['hour'] < 15) &
            ~((self.data['hour'] == 11) & (self.data['minute'] > 30)) &
            ~((self.data['hour'] == 12))
        )
    
    def generate_signals(self):
        """生成交易信号"""
        # EMA与布林带中线交叉
        self.data['ema_cross_above'] = (self.data['fast_ema'] > self.data['bb_middle']) & \
                                      (self.data['fast_ema'].shift(1) <= self.data['bb_middle'].shift(1))
        self.data['ema_cross_below'] = (self.data['fast_ema'] < self.data['bb_middle']) & \
                                      (self.data['fast_ema'].shift(1) >= self.data['bb_middle'].shift(1))
        
        # 多头信号条件
        bull_conditions = [
            self.data['ema_cross_above'],  # EMA上穿布林带中线
            self.data['close'] > self.data['bb_middle'],  # 价格位于中线上方
            self.data['ao_bullish'],  # AO看涨动量
            self.data['close'] < self.data['bb_upper'],  # 价格低于布林带上轨
            self.data['squeeze'],  # 布林带窄幅
            self.data['in_trade_time']  # 在交易时间内
        ]
        
        # 空头信号条件 (A股做空受限，但可用于卖出信号)
        bear_conditions = [
            self.data['ema_cross_below'],  # EMA下穿布林带中线
            self.data['close'] < self.data['bb_middle'],  # 价格位于中线下方
            self.data['ao_bearish'],  # AO看跌动量
            self.data['close'] > self.data['bb_lower'],  # 价格高于布林带下轨
            self.data['squeeze'],  # 布林带窄幅
            self.data['in_trade_time']  # 在交易时间内
        ]
        
        # 生成信号 (1:买入, -1:卖出, 0:无信号)
        self.data['signal'] = 0
        self.data['signal'] = np.where(
            pd.concat(bull_conditions, axis=1).all(axis=1), 
            1, self.data['signal'])
        
        self.data['signal'] = np.where(
            pd.concat(bear_conditions, axis=1).all(axis=1), 
            -1, self.data['signal'])
        
        # 计算止损价格
        self.data['stop_loss'] = self.data['close'] * (1 - self.stop_loss_pct/100)
        
        # 标记实际交易信号点
        self.data['buy_signal'] = np.where(self.data['signal'] == 1, self.data['close'], np.nan)
        self.data['sell_signal'] = np.where(self.data['signal'] == -1, self.data['close'], np.nan)
    
    def backtest(self):
        """执行回测"""
        capital = 100000  # 初始资金
        position = 0  # 持仓数量
        entry_price = 0  # 入场价格
        
        equity_curve = []
        trades = []
        
        for i, (idx, row) in enumerate(self.data.iterrows()):
            # 初始化
            if i == 0:
                equity_curve.append(capital)
                continue
                
            prev_row = self.data.iloc[i-1]
            
            # 检查是否有买入信号
            if position == 0 and row['signal'] == 1 and prev_row['signal'] != 1:
                # 计算可买数量 (A股最小100股)
                position = capital // (row['close'] * 100) * 100
                if position > 0:
                    entry_price = row['close']
                    capital -= position * entry_price
                    trades.append(('BUY', idx, entry_price, position))
            
            # 检查是否有卖出信号或止损
            elif position > 0:
                # 检查止损
                if row['low'] <= row['stop_loss']:
                    # 以止损价或开盘价卖出
                    exit_price = max(row['stop_loss'], row['open'])
                    capital += position * exit_price
                    trades.append(('SELL', idx, exit_price, position, 'STOP LOSS'))
                    position = 0
                
                # 检查卖出信号
                elif row['signal'] == -1 and prev_row['signal'] != -1:
                    capital += position * row['close']
                    trades.append(('SELL', idx, row['close'], position, 'SIGNAL'))
                    position = 0
            
            # 更新权益曲线
            current_equity = capital + (position * row['close'] if position > 0 else 0)
            equity_curve.append(current_equity)
        
        # 最后一天平仓
        if position > 0:
            last_close = self.data.iloc[-1]['close']
            capital += position * last_close
            trades.append(('SELL', self.data.index[-1], last_close, position, 'CLOSE OUT'))
            position = 0
        
        self.equity_curve = equity_curve
        self.trades = trades
        self.final_capital = capital
    
    def plot_results(self):
        """绘制策略结果"""
        fig, (ax1, ax2, ax3, ax4) = plt.subplots(4, 1, figsize=(15, 12), gridspec_kw={'height_ratios': [3, 1, 1, 1]})
        
        # 价格和布林带
        ax1.plot(self.data.index, self.data['close'], label='收盘价', linewidth=1, color='black')
        ax1.plot(self.data.index, self.data['bb_middle'], label='布林带中线', linewidth=1, color='blue')
        ax1.plot(self.data.index, self.data['bb_upper'], label='布林带上轨', linewidth=1, color='red', linestyle='--')
        ax1.plot(self.data.index, self.data['bb_lower'], label='布林带下轨', linewidth=1, color='green', linestyle='--')
        
        # 买卖信号
        ax1.scatter(self.data.index, self.data['buy_signal'], color='green', marker='^', s=100, label='买入信号', zorder=5)
        ax1.scatter(self.data.index, self.data['sell_signal'], color='red', marker='v', s=100, label='卖出信号', zorder=5)
        
        # 填充窄幅区域
        squeeze_periods = self.data[self.data['squeeze']]
        for idx in squeeze_periods.index:
            ax1.axvspan(idx, idx, alpha=0.1, color='blue')
        
        ax1.set_title(f'{self.stock_code} 布林带振荡器策略')
        ax1.legend()
        ax1.grid(True)
        
        # AO指标
        ax2.bar(self.data.index, self.data['ao'], color=np.where(self.data['ao'] > 0, 'green', 'red'), alpha=0.7)
        ax2.axhline(y=0, color='black', linestyle='-', linewidth=0.5)
        ax2.set_title('AO动量振荡器')
        ax2.grid(True)
        
        # 布林带宽度
        ax3.plot(self.data.index, self.data['bb_width'], label='布林带宽度', linewidth=1, color='purple')
        ax3.plot(self.data.index, self.data['bb_width_avg'], label='平均宽度', linewidth=1, color='orange')
        ax3.axhline(y=self.data['bb_width_avg'].mean() * (1 - self.squeeze_percentage/100), 
                   color='blue', linestyle='--', label='窄幅阈值')
        ax3.set_title('布林带宽度')
        ax3.legend()
        ax3.grid(True)
        
        # 权益曲线
        ax4.plot(self.data.index, self.equity_curve, label='资金曲线', linewidth=2, color='blue')
        ax4.set_title('资金曲线')
        ax4.legend()
        ax4.grid(True)
        
        # 调整布局
        plt.tight_layout()
        plt.show()
    
    def get_performance_report(self):
        """生成性能报告"""
        initial_capital = 100000
        final_capital = self.final_capital
        total_return = (final_capital - initial_capital) / initial_capital * 100
        
        # 计算年化收益率
        days = (self.data.index[-1] - self.data.index[0]).days
        annual_return = (1 + total_return/100) ** (365/days) - 1 if days > 0 else 0
        
        # 计算最大回撤
        equity_series = pd.Series(self.equity_curve)
        rolling_max = equity_series.expanding().max()
        drawdown = (equity_series - rolling_max) / rolling_max * 100
        max_drawdown = drawdown.min()
        
        # 交易统计
        buy_trades = [t for t in self.trades if t[0] == 'BUY']
        sell_trades = [t for t in self.trades if t[0] == 'SELL']
        
        winning_trades = 0
        for i in range(min(len(buy_trades), len(sell_trades))):
            if sell_trades[i][2] > buy_trades[i][2]:
                winning_trades += 1
        
        win_rate = winning_trades / len(buy_trades) * 100 if buy_trades else 0
        
        report = {
            '股票代码': self.stock_code,
            '回测期间': f"{self.data.index[0].strftime('%Y-%m-%d')} 至 {self.data.index[-1].strftime('%Y-%m-%d')}",
            '初始资金': f"{initial_capital:,.2f}",
            '最终资金': f"{final_capital:,.2f}",
            '总收益率': f"{total_return:.2f}%",
            '年化收益率': f"{annual_return*100:.2f}%",
            '最大回撤': f"{max_drawdown:.2f}%",
            '总交易次数': f"{len(buy_trades)}",
            '盈利交易次数': f"{winning_trades}",
            '胜率': f"{win_rate:.2f}%",
            '止损比例': f"{self.stop_loss_pct}%"
        }
        
        return report

# 使用示例
if __name__ == "__main__":
    # 创建策略实例 - 以上证指数为例
    strategy = AShareBollingerStrategy(
        stock_code='sh000001',  # 上证指数
        start_date='20230101',
        end_date='20231231',
        bb_period=20,
        bb_std=2.0,
        fast_ema_period=3,
        ao_fast_period=5,
        ao_slow_period=34,
        squeeze_percentage=20,
        stop_loss_pct=2.0,
        trade_start_time="09:30",
        trade_end_time="14:55"
    )
    
    # 绘制结果
    strategy.plot_results()
    
    # 打印性能报告
    report = strategy.get_performance_report()
    print("\n策略绩效报告:")
    print("=" * 50)
    for key, value in report.items():
        print(f"{key}: {value}")
```

### <font style="color:rgb(15, 17, 21);">3. 实盘操作步骤</font>
#### <font style="color:rgb(15, 17, 21);">第一步：选股</font>
+ <font style="color:rgb(15, 17, 21);">选择流动性好的股票(日成交额 > 1亿)</font>
+ <font style="color:rgb(15, 17, 21);">避免ST股和即将退市股票</font>
+ <font style="color:rgb(15, 17, 21);">优先选择波动性适中的蓝筹股</font>

#### <font style="color:rgb(15, 17, 21);">第二步：盘中监控</font>
1. **<font style="color:rgb(15, 17, 21);">开盘准备</font>**<font style="color:rgb(15, 17, 21);"> </font><font style="color:rgb(15, 17, 21);">(9:15-9:25)</font>
    - <font style="color:rgb(15, 17, 21);">检查前日布林带状态</font>
    - <font style="color:rgb(15, 17, 21);">确认是否有窄幅收缩情况</font>
2. **<font style="color:rgb(15, 17, 21);">交易时段</font>**<font style="color:rgb(15, 17, 21);"> </font><font style="color:rgb(15, 17, 21);">(9:30-11:30, 13:00-14:55)</font>
    - <font style="color:rgb(15, 17, 21);">监控快速EMA与布林带中线的关系</font>
    - <font style="color:rgb(15, 17, 21);">观察AO动量指标方向</font>
    - <font style="color:rgb(15, 17, 21);">等待三者共振信号</font>
3. **<font style="color:rgb(15, 17, 21);">入场条件</font>**<font style="color:rgb(15, 17, 21);">（同时满足）：</font>
    - <font style="color:rgb(15, 17, 21);">快速EMA上穿布林带中线</font>
    - <font style="color:rgb(15, 17, 21);">价格位于布林带中线上方</font>
    - <font style="color:rgb(15, 17, 21);">AO指标显示看涨动量且上升</font>
    - <font style="color:rgb(15, 17, 21);">布林带处于窄幅收缩状态</font>
    - <font style="color:rgb(15, 17, 21);">在交易时间内(避免尾盘)</font>
4. **<font style="color:rgb(15, 17, 21);">出场条件</font>**<font style="color:rgb(15, 17, 21);">：</font>
    - <font style="color:rgb(15, 17, 21);">达到止损位(2%)</font>
    - <font style="color:rgb(15, 17, 21);">出现反向信号</font>
    - <font style="color:rgb(15, 17, 21);">收盘前平仓(避免隔夜风险)</font>

#### <font style="color:rgb(15, 17, 21);">第三步：风险控制</font>
+ <font style="color:rgb(15, 17, 21);">单笔交易风险控制在总资金的2%以内</font>
+ <font style="color:rgb(15, 17, 21);">每日最大亏损控制在5%以内</font>
+ <font style="color:rgb(15, 17, 21);">避免在重大新闻发布前后交易</font>

### <font style="color:rgb(15, 17, 21);">4. 注意事项</font>
1. **<font style="color:rgb(15, 17, 21);">A股特色考虑</font>**<font style="color:rgb(15, 17, 21);">：</font>
    - <font style="color:rgb(15, 17, 21);">T+1交易制度：当日买入需次日才能卖出</font>
    - <font style="color:rgb(15, 17, 21);">涨跌停限制：避免在涨停板追涨</font>
    - <font style="color:rgb(15, 17, 21);">交易时间：严格在9:30-11:30, 13:00-15:00</font>
2. **<font style="color:rgb(15, 17, 21);">优化建议</font>**<font style="color:rgb(15, 17, 21);">：</font>
    - <font style="color:rgb(15, 17, 21);">根据不同股票调整参数</font>
    - <font style="color:rgb(15, 17, 21);">结合成交量确认突破</font>
    - <font style="color:rgb(15, 17, 21);">添加大盘趋势过滤(大盘下跌时减少操作)</font>
3. **<font style="color:rgb(15, 17, 21);">实盘前验证</font>**<font style="color:rgb(15, 17, 21);">：</font>
    - <font style="color:rgb(15, 17, 21);">至少进行3个月模拟交易</font>
    - <font style="color:rgb(15, 17, 21);">记录每笔交易并分析</font>
    - <font style="color:rgb(15, 17, 21);">逐步投入实盘资金</font>



> 更新: 2025-09-16 12:36:59  
> 原文: <https://www.yuque.com/lixinsi/dtxgrg/zigdqzipd04mke44>