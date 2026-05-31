# 全流程清理脚本以及只保留一个shpee

```sql
DELETE FROM [数据库名].[dbo].[tb_case]
WHERE [p01name] <> 'Shopee综合';
-- 解释：
-- DELETE FROM  指定要操作的表，格式为 [数据库名].[架构名].[表名]  ，这里架构名通常是 dbo
-- WHERE  子句用于筛选要删除的记录，<>  表示“不等于”，即删除 p01name 字段值不是 Shopee综合 的行，这样就只留下 p01name 为 Shopee综合 的数据了
```

delete [tb_userinfo] where ukind='3'  
delete tb_userinfo where ukind=2  
truncate table [tb_team_manage]  
truncate table [DSBaoMing]



2020-04-21：最新

```json
delete tb_amazon_score;
delete tb_amazon_calendar;
delete tb_case_log;
delete tb_aliexpress_training;
delete tb_release_pro;
delete tb_alibab_pro_image;
delete tb_aliexpress_email;
delete tb_aliexpress_company;
delete tb_aliexpress_config_two;
delete tb_aliexpress_pro_attr;
delete tb_aliexpress_order_info;
delete tb_aliexpress_order;
delete tb_aliexpress_porder;
delete tb_aliexpress_release_pro;
delete tb_aliexpress_service_template;
delete tb_aliexpress_logistics_template;
delete tb_aliexpress_del_customer_info;
delete tb_aliexpress_del_customer;
delete tb_aliexpress_del_pro;
delete tb_aliexpress_express;
delete tb_aliexpress_config_customer;
delete tb_aliexpress_case_consuly;
delete tb_aliexpress_config_one;
delete tb_aliexpress_case_calendar;
delete tb_eBay_calendar;
delete tb_eBay_training;
delete tb_amazon_company;
delete tb_eBay_config_three;
delete tb_eBay_product_attr;
delete tb_eBay_order_info;
delete tb_eBay_porder;
delete tb_amazon_order;
delete tb_eBay_order;
delete tb_eBay_release_pro;
delete tb_eBay_case_customer;
delete tb_eBay_case_product;
delete tb_eBay_follow_up;
delete tb_amazon_config_two;
delete tb_amazon_ca;
delete tb_amazon_customer_days;
delete tb_eBay_customer_days;
delete tb_text_reminder;
delete tb_case_training_time;
delete tb_Wish_calendar;
delete tb_Wish_training;
delete tb_Wish_config_three;
delete tb_Wish_product_attr;
delete tb_Wish_order_info;
delete tb_amazon_order_info;
delete tb_amazon_porder;
delete tb_Wish_porder;
delete tb_Wish_order;
delete tb_Wish_release_pro;
delete tb_Wish_case_customer;
delete tb_Wish_case_product;
delete tb_Wish_follow_up;
delete tb_Wish_customer_days;
delete tb_Wish_TestScore;
delete tb_case_cpc;
delete tb_case_cpc_detail;
delete tb_case_wh_ad;
delete tb_amazon_case_customer;
delete tb_amazon_case_product;
delete tb_aliexpress_customer;
delete tb_documents;
delete tb_alibaba_customer;
delete tb_alibaba_case_customer;
delete tb_alibaba_config_customer;
delete tb_alibaba_order_info;
delete tb_alibaba_proder;
delete tb_alibab_release_pro;
delete tb_alibaba_express;
delete tb_alibaba_consult_log;
delete tb_alibaba_order;
delete tb_alibaba_statr_case;
delete tb_amazon_config_three;
delete tb_amazon_product_attr;
delete tb_simulatedorder;
delete tb_amazon_release_pro;
delete tb_amazon_training;
delete tb_amazon_follow_up;
delete tb_decorate_manager;
delete tb_decorate_banner;
delete tb_decorate_cycle_pic;
delete tb_decorate_recommend;
delete tb_Shopee_calendar;
delete tb_Shopee_training;
delete tb_Shopee_config_three;
delete tb_Shopee_product_attr;
delete tb_Shopee_order_info;
delete tb_Shopee_porder;
delete tb_Shopee_order;
delete tb_Shopee_release_pro;
delete tb_Shopee_case_customer;
delete tb_Shopee_case_product;
delete tb_Shopee_follow_up;
delete tb_Shopee_customer_days;
delete tb_Shopee_Discount;
delete tb_Shopee_Coupon_Shop;
delete tb_Shopee_Suit;
delete tb_Shopee_Follow;
delete tb_Shopee_Freight_Promotion;
delete tb_alibaba_company;
delete tb_Shopee_My_Loan;
delete tb_Shopee_Verification;
delete tb_Wish_convert_log;
delete tb_wish_convet_type
delete tb_text_reminder;
delete tb_ContestInfo;
delete CreatOrder_log;
delete tb_case_stock_order ;
delete tb_case_training
delete tb_case_user_stock;
delete tb_TotalScore;

delete tb_shopee_AdKey_main
delete tb_shopee_AdKey_info
delete tb_Match_final_rank
DELETE tb_Match_TotalScore
DELETE tb_Shopee_Discount_Product
delete tb_shopee_product_range
DELETE tb_Shopee_Coupon_Product
DELETE tb_Shopee_Suit_Product
DELETE tb_Shopee_Freight_Detail
DELETE tb_Login_Log
DELETE tb_aliexpress_freight_template
DELETE tb_query_info
DELETE tb_aliexpress_freight_template_plan
DELETE tb_ProductGrouping
```



> 更新: 2025-06-25 17:20:57  
> 原文: <https://www.yuque.com/lixinsi/kmvnv0/gd1prv0ml8c1r3pq>