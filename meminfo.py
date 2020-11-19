import os
 
cpuinfo =str(os.popen('free -m | awk \'NR==2{printf \"{ \\"used\\":%d, \\"free\\": \\"%d\\" }\", $3,$4 }\'').readline())
 
print(cpuinfo)