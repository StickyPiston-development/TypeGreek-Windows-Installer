import sys,os,shutil

if getattr(sys, 'frozen', False):
    application_path = os.path.dirname(sys.executable)
    running_mode = 'Frozen/executable'
else:
    try:
        app_full_path = os.path.realpath(__file__)
        application_path = os.path.dirname(app_full_path)
        running_mode = "Non-interactive (e.g. 'python myapp.py')"
    except NameError:
        application_path = os.getcwd()
        running_mode = 'Interactive'

addon_folder = os.path.join(application_path, 'addons\\')

print('Running mode:', running_mode)
print('  Appliction path  :', application_path)
print('  Addons full path :', addon_folder)

if len(sys.argv) > 1:
    addonfile = sys.argv[1]
    print(addonfile)
    shutil.copy(addonfile, addon_folder)
else:
    print("\nError: args may not be empty")