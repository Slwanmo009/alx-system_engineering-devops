#!/usr/bin/python3
"""
This script fetches an employee's TODO list progress using a REST API.
"""

import requests
import sys

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: {} <employee_id>".format(sys.argv[0]))
        sys.exit(1)

    employee_id = sys.argv[1]

    # Fetch user data
    user_url = "https://jsonplaceholder.typicode.com/users/{}".format(employee_id)
    user_response = requests.get(user_url).json()
    employee_name = user_response.get('name')

    # Fetch TODO list data
    todos_url = "https://jsonplaceholder.typicode.com/todos?userId={}".format(employee_id)
    todos_response = requests.get(todos_url).json()

    total_tasks = len(todos_response)
    completed_tasks = [task for task in todos_response if task.get('completed')]
    number_of_done_tasks = len(completed_tasks)

    # Print employee TODO list progress
    print("Employee {} is done with tasks({}/{}):".format(
        employee_name, number_of_done_tasks, total_tasks))
    
    for task in completed_tasks:
        print("\t {}".format(task.get('title')))
