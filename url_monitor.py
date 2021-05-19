import requests
import time
import sys

url = sys.argv[1]

while True:
  try:
    #simple timer to calculate the beginning and ending of the GET request
    start = time.time()
    response = requests.get(url)
    end = time.time()
    if response.status_code == 200:
      print("response code")
      print(response.status_code)
      print("time from request to first response(seconds)")
      #requests has a built in method which calculates the time from first
	  #request, to the first moment of the response. Doesn't totally tell the whole story,
	  #so including both times is beneficial for analytics
	  print(response.elapsed.total_seconds())
      print("time to download page and elements(seconds)")
      print(end - start)
    else:
      print(response)
  except Exception as e:
    print("fail")
    print(e)
    sys.exit()
  time.sleep(60)

