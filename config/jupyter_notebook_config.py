# Notebook standard configuration
c.NotebookApp.ip = "0.0.0.0"
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.token = ""

# Enable Matplotlib Inline by default
c.InteractiveShellApp.exec_lines = []
c.InteractiveShellApp.extensions = ["matplotlib"]
c.InteractiveShellApp.matplotlib = "inline"
