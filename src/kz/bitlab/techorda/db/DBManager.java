package kz.bitlab.techorda.db;

import java.util.ArrayList;

public class DBManager {
    static ArrayList<Task> tasks = new ArrayList<>(

    );

    static {
        tasks.add(new Task(1L,
                "Домашняя работа",
                "Не сделаю домашку по физике до вечера, мама убьет",
                "2023-04-13")
        );

        tasks.add(new Task(2L,
                "Битлаб Спринттаск",
                "Надо быстрее закончить спринт по ДжаваЕЕ, осталось только доделать addTask",
                "2023-04-13")
        );

        tasks.add(new Task(3L,
                "Дочитать книгу",
                "Гарри Поттер Роулинга",
                "2023-05-01")
        );

        tasks.add(new Task(4L,
                "Доделать презентацию по казахскому",
                "Как может твоя профессия помочь развить казахсикй язык",
                "2023-04-15")
        );
    }

    static long id = tasks.size();

    public static void addTask(Task task) {
        task.setId(++id);
        tasks.add(task);
    }

    public static Task getTask(Long id) {
        for (Task t : tasks) {
            if (t.getId() == id) return t;
        }
        return null;
    }

    public static ArrayList <Task> getAllTasks() {
        return tasks;
    }

    public static void deleteTask(Long id) {
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == id) {
                tasks.remove(i);
                break;
            }
        }

    }

    public static void saveTask(Task task) {
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == task.getId()) {
                tasks.get(i).setName(task.getName());
                tasks.get(i).setDescription(task.getDescription());
                tasks.get(i).setDeadlineDate(task.getDeadlineDate());
                tasks.get(i).setStatus(task.getStatus());

            }

        }
    }
}
