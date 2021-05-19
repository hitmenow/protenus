import requests
import time
import sys

url = sys.argv[1]

while True:
  try:
    start = time.time()
    response = requests.get(url)
    end = time.time()
    if response.status_code == 200:
      print("response code")
      print(response.status_code)
      print("time from request to first response(seconds)")
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

