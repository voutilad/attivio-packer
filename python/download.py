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
    url = _RELEASES + 'v' + str(version)
    url = url + '/x64Linux/Installer/do-not-distribute/attivio.license'

    r = requests.get(url)
    if r.status_code == 200:
        return url, 'attivio.license'
    else:
        print 'Cannot find license at ' + url
        return None


def find_module(version, module, platform='x64Linux'):
    module_root = _RELEASES + 'v' + str(version) + '/' + platform + '/Modules/'
    root = requests.get(module_root)

    if root.status_code != 200:
        print 'Failed to get root of releases server: ' + versionRoot
        return None

    m = re.search('<a href="(' + str(module).lower() + ')/">', root.text)
    if len(m.groups()) == 1:
        file_root = module_root + module + '/target/dist/'
        root = requests.get(file_root)

        if root.status_code != 200:
            print 'Failed to get root of module files: ' + file_root
            return None

        m = re.search('<a href="(.+?)(\.zip|\.tar\.gz)"', root.text)
        filename = m.groups()[0] + m.groups()[1]
        return file_root + '/' + filename, filename


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
    print 'Usage: python download.py <attivio version> <installer | license | module name>'
    print '\tex: >python download.py 4.3.2 installer'

if __name__ == '__main__':
    if len(sys.argv) != 3:
        usage()
    else:
        version = sys.argv[1]
        method = sys.argv[2].lower()

        if method == 'installer':
            url, file = find_installer(version)
        elif method == 'license':
            url, file = find_license(version)
        else:
            url, file = find_module(version, method)

        download(url, file)
