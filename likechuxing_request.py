# encoding: utf-8
import urllib
import urllib2
import time
import hashlib

def formatRequestParam(cityId, cityName):	
	request_param = {"channel": "AppStore", "city_id": "199", "city_name": "深圳市", "client_time": "1528877804.790816", "device_name": "iPhone5s", "sign": "", "token": "", "user_lat": "22.550581", "user_lng": "113.933967", "user_sys_version": "10.0.2", "user_version": "ios_2108", "uuid": ""}
	request_param["city_id"] = cityId
	request_param["city_name"] = cityName

	request_param["client_time"] = str(time.time())

	# print 'format request before:' 
	# print request_param

	verification = signRequestParam(request_param)
	request_param["verification"] = verification

	# print 'format request after:' 
	# print request_param

	return request_param
	

def md5ForUpper32Byte(str):
	md5 = hashlib.md5()
	md5.update(str)
	return md5.hexdigest().upper()


def signRequestParam(param_dic):
	sortedKeys = sorted(param_dic.keys())

	beforeSignStr = ''
	for key in sortedKeys:
		value = param_dic[key]
		if value != "":
			beforeSignStr = beforeSignStr + key + '=' + value + 'K'
		
	beforeSignStr = beforeSignStr + 'key='
	afterSignStr = md5ForUpper32Byte(beforeSignStr)

	# print 'beforeSignStr:' + beforeSignStr
	# print 'afterSignStr' + afterSignStr

	return afterSignStr


def requestBranchList(cityId, cityName):
	request_param = formatRequestParam(cityId, cityName)

	url = "https://api.likechuxing.com/branch/list"
	headers = {"User-Agent": "ShareCarProject/2.1.6 (iPhone; iOS 11.0.3; Scale/2.00)", "Content-Type": "application/x-www-form-urlencoded", "Accept-Encoding": "br, gzip, deflate"}
	data = urllib.urlencode(request_param)

	request = urllib2.Request(url, data = data, headers = headers)
	response = urllib2.urlopen(request)

	return response.read()



class CityModel(object):
	"""docstring for CityModel"""
	def __init__(self, city_id, city_name):
		super(CityModel, self).__init__()
		self.city_id = city_id
		self.city_name = city_name

		

if __name__ == '__main__':
	# response = requestBranchList("199", "深圳市")
	# print response

	cityModel1 = CityModel('235', '成都市')
	cityModel2 = CityModel('202', '佛山市')
	cityModel3 = CityModel('197', '广州市')
	cityModel4 = CityModel('183', '长沙市')
	cityModel5 = CityModel('169', '武汉市')
	cityModel6 = CityModel('74', '南京市')
	

	cityList = [cityModel1, cityModel2, cityModel3, cityModel4, cityModel5, cityModel6]

	for cityModel in cityList:
		responseStr = requestBranchList(cityModel.city_id, cityModel.city_name)
		print '城市名：' + cityModel.city_name
		print responseStr

