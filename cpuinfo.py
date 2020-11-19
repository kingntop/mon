
import os
 
cpuinfo =str(os.popen('top -bn2 | grep \"Cpu(s)\" | awk \'NR>1{printf \"{ \\"used\\": \\"%.1f\\",\\"free\\": \\"%.1f\\"}\", $2,$4 }\'').readline())
 
print(cpuinfo)