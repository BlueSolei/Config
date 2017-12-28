#!/usr/bin/env python

# Command line arguments parsing
import argparse

# GUI
try:
	import tkinter as tk  # for python 3
	from tkinter import messagebox
except:
	import Tkinter as tk  # for python 2
	from Tkinter import messagebox
import pygubu

class Application(pygubu.TkApplication):

	def __init__(self, master, fileName):

		with open(fileName, 'r') as fileCommitMessage:
			self.commitMessage = fileCommitMessage.read()
		print("commitMessage: " + self.commitMessage + "\n")

		#1: Create a builder
		self.builder = builder = pygubu.Builder()

		#2: Load an ui file
		builder.add_from_file('CommitMessageEditor.ui')

		#3: Create the widget using a master as parent
		self.mainwindow = builder.get_object('mainwindow', master)

		# Configure callbacks
		builder.connect_callbacks(self)

	def on_ok(self):
		messagebox.showinfo('Message', 'You clicked OK')

	def on_cancel(self):
		messagebox.showinfo('Message', 'You clicked Cancel')

if  __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Editor for the D2P git commit message')
	parser.add_argument('fileName', metavar="filename", nargs=1, help='the file contain the commit message')
	args = parser.parse_args()
	root = tk.Tk()
	app = Application(root, args.fileName[0])
	root.mainloop()
