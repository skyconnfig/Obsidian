# SearXNG 是一款免费的互联网元搜索引擎

# 西尔

SearXNG 是一款免费的互联网元搜索引擎，可汇总来自各种搜索服务和数据库的结果。用户不会被跟踪或分析。Dify 已实现访问 SearXNG 的界面，因此您可以直接在 Dify 中使用它。以下是在 Dify 中集成 SearXNG 的步骤。

## 1.使用Docker安装SearXNG

已复制！

```plain
docker run --rm \
             -d -p 8080:8080 \
             -v "${PWD}/searxng:/etc/searxng" \
             -e "BASE_URL=http://0.0.0.0:8080/" \
             -e "INSTANCE_NAME=searxng" \
             searxng/searxng
```

如果您打算使用其他方法安装 SearXNG。请参阅[此页面](https://docs.searxng.org/admin/installation.html)。

```python
docker run --rm -d -p 8080:8080 -v "${PWD}/searxng:/etc/searxng" -e "BASE_URL=http://0.0.0.0:8080/" -e "INSTANCE_NAME=searxng" searxng/searxng 
```

安装 SearxNG 时，默认输出格式为 HTML 格式。您需要激活 json 格式。将以下行添加到 settings.yml 文件。settings.yml 文件位于 ${PWD}/searxng/settings.yml，如上例所示。

复制

```plain
# remove format to deny access, use lower case.
  # formats: [html, csv, json, rss]
  formats:
    - html
    - json    # <-- add this line
```

## 3. 在 Dify 中集成 SearXNG

在页面中填写基本网址http://xxxx:8080`Tools > SearXNG > To Aut`即可激活。

## 4. 完成


> 更新: 2024-08-08 17:48:45  
> 原文: <https://www.yuque.com/lixinsi/nyg25m/eexuzin5845g9ri2>