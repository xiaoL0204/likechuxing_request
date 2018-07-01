# 使用MonkeyDev破解签名算法（无需越狱）


破解过程中隐藏了关键信息，另外如果直接运行工程或python脚本是得不到任何结果的。
本demo只展示了破解的过程，如网上其它破解教程一样只演示了如何破解，和每个关键步骤的输出成果。

Likechuxing签名破解工程：用于破解app，对砸壳后的app进行hook，打印出关键信息就能大体知道内部的实现；
Likechuxing签名验证：用于快速验证签名算法，对相同的数字进行加密，通过对比能知道签名函数是否正确；
likechuxing_request.py：产出签名算法和请求接口，直接使用接口发起请求，然后将响应内容打印出来。


likechuxing_request.py
使用urllib2库发起请求，通过构造HTTP请求头和请求参数，生成一个合理的HTTP请求。
请求参数的verification最关键，是其它参数进行拼接得到的字符串后md5得到的值，是服务器验证这个请求合法性的关键。
注意一定要设置请求的UA，否则即使签名参数是对的，接口服务器也会判断为非法请求。

likechuxing_request.py脚本中定义了一个CityModel类，包含city_id、city_name等属性，用于构建请求，获取该城市的所有网点列表。


