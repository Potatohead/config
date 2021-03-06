# Default time a notification is show, unless specified in notification
DEFAULT_NOTIFY_TIMEOUT = 30000 # milliseconds

# Maximum time a notification is allowed to show
MAX_NOTIFY_TIMEOUT = 30000 # milliseconds

# Maximum number of characters in a notification. 
NOTIFICATION_MAX_LENGTH = 100 # number of characters

# Time between regular status updates
STATUS_UPDATE_INTERVAL = 2.0 # seconds

# Command to fetch status text from. We read from stdout.
# Each argument must be an element in the array
# os must be imported to use os.getenv
import os
STATUS_COMMAND = ['/bin/sh', '%s/.statnot/statusline.sh' % os.getenv('HOME')] 

# Always show text from STATUS_COMMAND? If false, only show notifications
USE_STATUSTEXT=True

# Put incoming notifications in a queue, so each one is shown.
# If false, the most recent notification is shown directly.
QUEUE_NOTIFICATIONS=True

# update_text(text) is called when the status text should be updated
# If there is a pending notification to be formatted, it is appended as
# the final argument to the STATUS_COMMAND, e.g. as $1 in default shellscript

# dwm statusbar update
import subprocess
def update_text(text):
    import os
    try:
        os.mkfifo("%s/.statnot/notification.pipe" % os.getenv("HOME"))
    except OSError, e:
        1    
    file = open("%s/.statnot/notification.pipe" % os.getenv("HOME"), 'w')
    file.write(text);
    file.close;
    # Get first line
    #lines = text.splitlines(True)
    # subprocess.call(["xsetroot", "-name", first_line])
    #f = open('/tmp/stat.txt', 'w')
    #f.write(lines[-1])
    #f.close
