# 使用MonkeyDev破解签名算法（无需越狱）


破解过程中隐藏了关键信息，另外如果直接运行工程或python脚本是得不到任何结果的。
本demo只展示了破解的过程，如网上其它破解教程一样只演示了如何破解，和每个关键步骤的输出成果。

Likechuxing签名破解工程：用于破解app，对砸壳后的app进行hook，打印出关键信息就能大体知道内部的实现；
Likechuxing签名验证：用于快速验证签名算法，对相同的数字进行加密，通过对比能知道签名函数是否正确；
likechuxing_request.py：产出签名算法，直接使用接口发起请求，然后将响应内容打印出来。


likechuxing_request.py
使用urllib发起请求，伪造HTTP请求头，构建一个HTTP请求


