# 基金预估提醒

每天下午 2:40 发送持有基金涨跌提示推送到自己手机。

## 基于

### GitHub Actions

本项目基于 GitHub Actions 提供脚本定时运行环境。

### Bark

本项目基于 Bark 向自己的手机发送远程消息。点击[此处](https://github.com/Finb/Bark)了解更多关于 Bark 的内容。

## 使用方法

1. Fork 本项目。
2. 可以修改`./.github/workflows/judgment.yml`文件中的 cron 表达式来调整定时执行的时间。
3. 在项目根目录中创建 JSON 文件，一个 JSON 文件对应一个基金，文件中按格式设置基金代码/基金名称及持仓成本价，当发生交易后，需更新对应的持仓成本价。
4. 在 GitHub 项目`Settings->Secrets`中添加 Bark 设备号。
