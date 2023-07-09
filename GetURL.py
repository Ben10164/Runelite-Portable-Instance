import json
import requests

# this file is run whenever there is no RuneLite.jar 
# file in the latest release.

url = 'https://api.github.com/repos/runelite/launcher/releases'

data = json.loads(requests.get(url).text)
# go through each of the tags (latest to earliest)
# until a RuneLite.jar is found
for release in data:
    release_tag = release['tag_name']
    # print(release_tag)
    for asset in release['assets']:
        if asset['name'] == 'RuneLite.jar':
            # print("Universal Jar found in release", release_tag)
            print(asset['browser_download_url'], end='')
            exit()
