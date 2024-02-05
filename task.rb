class TaskManager
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
    puts "Task added: #{task}"
  end

  def view_tasks
    if @tasks.empty?
      puts "No tasks available."
    else
      puts "Tasks:"
      @tasks.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
    end
  end

  def remove_task(index)
    if index >= 1 && index <= @tasks.length
      removed_task = @tasks.delete_at(index - 1)
      puts "Task removed: #{removed_task}"
    else
      puts "Invalid index. Please try again."
    end
  end
end

def main
  task_manager = TaskManager.new

  loop do
    puts "\nTask Manager Menu:"
    puts "1. Add Task"
    puts "2. View Tasks"
    puts "3. Remove Task"
    puts "4. Exit"
    print "Select an option: "

    choice = gets.chomp.to_i

    case choice
    when 1
      print "Enter task: "
      task = gets.chomp
      task_manager.add_task(task)
    when 2
      task_manager.view_tasks
    when 3
      print "Enter index to remove: "
      index = gets.chomp.to_i
      task_manager.remove_task(index)
    when 4
      puts "Exiting Task Manager. Goodbye!"
      break
    else
      puts "Invalid option. Please try again."
    end
  end
end

main
