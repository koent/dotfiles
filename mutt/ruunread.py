import imaplib

imap_user = "k.timmermans@student.ru.nl"
imap_server = "localhost"
with open("ruaccount", "r") as myfile: imap_pass = myfile.read()[:-1]

imap_port = 1143

try:
    imap = imaplib.IMAP4(imap_server, imap_port)
    imap.login(imap_user, imap_pass)
    imap.select('Inbox')
    _, r = imap.search(None, 'Unseen')
    if r == [b'']:
        print(0)
    else:
         print(len(r))
except:
    print(0)
