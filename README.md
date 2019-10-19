# Aliyun::Dysms
### 阿里云-短信通知服务 Ruby Gem aliyun-dysms

## 使用前提

使用 aliyun-dysms 前，您必须已经是阿里云注册用户，申请开通了“阿里云_短信服务
”，并且获得了以下关键参数: 

AppCode: 阿里云应用密钥。

## Installation 安装

### Ruby 通用安装方法
在命令行中输入命令（电脑已经安装 gems 命令行工具）

```ruby
gem install aliyun-dysms
```

### Rails 应用安装方法

在应用的 Gemfile 文件中添加 Ruby Gems 安装源:

```ruby
gem 'aliyun-dysms'   # Ruby Gems 安装源
```

应用的根目录下运行:

```ruby
bundle
```

### 下载后安装

使用 Git 将代码克隆到本地后使用 Rake 命令安装

```bash
git clone https://github.com/kejincan0527/aliyun-dysms.git

cd aliyun-dysms

rake build

rake install
```

### 安装可能遇到的问题及其解决方式  

安装后，如果在 irb 命令行输入命令

```ruby
require 'aliyun/dysms'
```

后，无法正确获取 Gem 引用，或者在 Rails 启动时报错提示如下: 

> ./config/initializers/aliyun-dysms.rb:1:in `<top (required)>': uninitialized constant Aliyun::Dysms (NameError)

可以改为 Github 安装源，例如 Rails Gemfile 文件引用可以改为下面格式，即可正确安装。

```ruby
gem 'aliyun-dysms', '0.0.1', git: 'https://github.com/kejincan0527/aliyun-dysms.git'
```

## Usage 使用

### Ruby 程序通用方法（irb命令行示例）

#### 第一步: 

```bash
$ require 'aliyun/dysms'
```

```bash
=> true
```

#### 第二步: 

参数设置: 

```ruby
> Aliyun::Dysms.configure do |config|
    config.access_key_id     = ACCESS_KEY_ID      # 阿里云应用ID
    config.access_key_secret = ACCESS_KEY_SECRET  # 阿里云应用密钥
    config.sign_name         = SIGN_NAME          # 阿里云短信签名
  end
```
返回

```ruby
  => "新橙科技"
```

#### 第三步: 

发送短信: 

    $ Aliyun::Dysms.send(phone_numbers, template_code, template_param)

参数说明: 

1. phone_numbers:  接收短信的手机号码。支持对多个手机号码发送短信，手机号码之间以英文逗号（,）分隔；
2. template_code:  短信模板ID。请在控制台模板管理页面模板CODE一列查看。
3. template_param: 短信模板变量对应的实际值，JSON格式。

### Rails 应用使用方法

#### 第一步: 

在 Rails 应用目录 config/initializers/ 下创建脚本文件 aliyun-dysms.rb，在文件中加入以下内容: 

config/initializers/aliyun-dysms.rb

```ruby
Aliyun::Dysms.configure do |config|
  config.access_key_id     = ACCESS_KEY_ID      # 阿里云应用ID
  config.access_key_secret = ACCESS_KEY_SECRET  # 阿里云应用密钥
  config.sign_name         = SIGN_NAME          # 阿里云短信签名
end
```
之后，重新启动 Rails，加载配置。

#### 第二步: 

在 Rails 应用中调用短信发送代码: 

```ruby
...
phone_numbers = "15912345678"
template_code = "SMS_176030000"
template_param = {code: "1234"}.to_json

Aliyun::Dysms.send(phone_numbers, template_code, template_param)
...
```

## Development 开发

按照阿里云[阿里云官方接口文档](https://help.aliyun.com/product/44282.html)提供的 SMS 样例做了 spect 测试，可以 clone 项目后，在根目录下用命令行运行以下命令测试: 

    $ bundle exec rspec spec


## License 许可

MIT 协议下的开源项目。 [MIT License](http://opensource.org/licenses/MIT).
