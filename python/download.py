#!/bin/python
import requests
import sys, re

# m = re.search('<a href="(.+?)\.sh"', h)
_RELEASES = 'http://dev.corp.attivio.com/releases/'

def download(url, filename, chunkSizeInMB=10):
    '''
        Downloads the given url and streams it to a given file.
    '''
    print 'Fetching ' + url
    installer = requests.get(url, stream=True)
    with open(filename, 'wb') as fd:
        sys.stdout.write('Downloading...')
        sys.stdout.flush()
        for chunk in installer.iter_content(chunkSizeInMB * 1024 * 1024):
            sys.stdout.write('.')
            fd.write(chunk)
            sys.stdout.flush()
        print 'Complete'

def find_license(version):
    pass

def find_module(module, version, platform='x64Linux'):
    pass

def find_installer(version, platform='x64Linux'):
    '''
        Attempts to find the URL to the Attivio installer for the given version
    '''
    if not version:
        return None

    versionRoot = _RELEASES + 'v' + str(version) + '/' + platform + '/Installer'
    root = requests.get(versionRoot)
    if root.status_code != 200:
        print 'Failed to get root of releases server: ' + versionRoot
        return None

    print 'Found version ' + version + '...'

    m = re.search('<a href="(.+?)(\.sh|\.exe)">', root.text)
    #should have a tuple of file name and extension
    filename = m.groups()[0] + m.groups()[1]

    return versionRoot + '/' + filename, filename


def usage():
    print 'Usage: python download.py <attivio version>'

if __name__ == '__main__':
    if len(sys.argv) != 2:
        usage()
    else:
        version = sys.argv[1]
        path, filename = find_installer(version)
        print 'Installer ' + filename + ' located at ' + path
