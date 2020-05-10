import imaplib

imap_user = 'kahtimmermans'
imap_server = 'imap.gmail.com'
with open("gmaccount", "r") as myfile: imap_pass = myfile.read()[:-1]

imap_port = 993

try:
    imap = imaplib.IMAP4_SSL(imap_server, imap_port)
    imap.login(imap_user, imap_pass)
    imap.select('Inbox')
    _, r = imap.search(None, 'Unseen')
    if r == [b'']:
        print(0)
    else:
        print(len(r[0].split(b' ')))
except:
    print(0)

