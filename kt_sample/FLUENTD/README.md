# Fluentdにメッセージを送る

## 二つのユースケース

以下二つのユースケースが存在します．

1. デフォルトのロガーのログを送信する
1. 専用のロガーを使った時だけログを送信する

以下が細分化したユースケースです．  
それ以外の方法もありますが代表的な方法を記載しました．

| # | ユースケース                                                    | Logger                                       | Encoder                                               | Appender                                                                                                                   | Note                                                                                               |
|---|-----------------------------------------------------------|----------------------------------------------|-------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| 1 | [OFFICIAL] 専用のロガーを使った時だけログを送信する                           | https://github.com/fluent/fluent-logger-java |                                                       |                                                                                                                            |                                                                                                    |
| 2 | [UNOFFICIAL] fluentd用のカスタムappenderを使ってデフォルトのloggerをから送信する | https://github.com/qos-ch/logback            |                                                       | https://github.com/sndyuk/logback-more-appenders/tree/master                                                               |                                                                                                    |
| 3 | デフォルトのロガーでjson形式でファイルに出力してファイル内容をfluentdが読み取る             | https://github.com/qos-ch/logback            | https://github.com/logfellow/logstash-logback-encoder | https://logging.apache.org/log4j/1.x/apidocs/org/apache/log4j/RollingFileAppender.html                                     | https://kazuhira-r.hatenablog.com/entry/2019/03/24/223923                                          |
| 4 | デフォルトのロガーでjson形式に変換して通信を通してfluentdに送る                     | https://github.com/qos-ch/logback            | https://github.com/logfellow/logstash-logback-encoder | https://github.com/qos-ch/logback/blob/master/logback-classic/src/main/java/ch/qos/logback/classic/net/SocketAppender.java | https://stackoverflow.com/questions/40576959/logback-jsonlayout-printing-all-logs-on-the-same-line |

### 他の方法

- Encoderを使わずapplicationサイドでjsonにする方法や，別のencoderでjsonにする方法．
- UNOFFICIALなAppenderは他にも存在します．