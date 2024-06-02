from subprocess import run
from sys import argv

if len(argv) != 2:
    raise Exception('Expected argument: interface name')

ifc = argv[1]
output1 = run(['iwconfig', ifc], capture_output=True).stdout.decode('utf-8')
output2 = run(['ip', '-4', 'a', 'show', ifc], capture_output=True).stdout.decode('utf-8')
if output1 and output2:
    lines1 = output1.splitlines()
    lines2 = output2.splitlines()

    name = lines1[0].split(':')[-1].replace('"', '').strip()
    # dbm = lines1[5].split('=')[-1].split(' ')[0]
    dbm = round(((float(lines1[5].split('=')[-1].split(' ')[0]) + 20)/-70)*100)
    state = lines2[0].split()[8].strip()

    dbm_color = ''
    color_reset = '%{F-}'

    if dbm > 60:
        dbm_color = '%{F#a6e3a1}'
    elif dbm > 30:
        dbm_color = '%{F#f9e2af}'
    else:
        dbm_color = '%{F#ff5555}'

    match state:
        case 'UP':
            logo = '%{F#F0C674}󰖩 ' + ifc + '%{F-}'
            print(f'{logo} {dbm_color}{dbm}%{color_reset}  {name}')
        case _:
            logo = '%{F#707880}󰖪'
            print(f'{logo} {ifc} {state}')

