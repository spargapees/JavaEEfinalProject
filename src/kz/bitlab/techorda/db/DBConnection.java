package kz.bitlab.techorda.db;

import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

public class DBConnection {

    private static Connection connection;

    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/techorda_db", "root", "");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static ArrayList<Item> getAllItems() {
        ArrayList<Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM items");


            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) {

                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                int id = resultSet.getInt("id");
                Item item = new Item((long)id, name, description, price);
                items.add(item);
                System.out.println(name + " " + description);
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }

    public static void addBlog(Blog blog) {
        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "insert into news (post_date, title, content) " +
                    "values (NOW(), ?, ?)");

            statement.setString(1, blog.getTitle());
            statement.setString(2, blog.getContent());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Blog> getAllBlogs() {
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM news ORDER BY post_date DESC" +
                            "");


            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) {

                String postDate = resultSet.getString("post_date");

                int categoryId = resultSet.getInt("category_id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                int id = resultSet.getInt("id");
                Blog blog = new Blog(id, postDate, categoryId, title, content);
                blogs.add(blog);
            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return blogs;
    }

    public static void addItem(Item item) {
        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "insert into items (name, description, price) " +
                    "values (?, ?, ?)");

            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static User getUser(String mail) {
        User user = new User();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM users where email = ?");
            statement.setString(1, mail);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user.setFullName(resultSet.getString("full_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setId(resultSet.getLong("id"));
                user.setRole_id(resultSet.getInt("role_id"));
            }
            else user = null;
            statement.close();

        } catch (Exception e){
            e.printStackTrace();
        }
        return user;

    }

    public static User getUser(int id) {
        User user = new User();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM users where id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user.setFullName(resultSet.getString("full_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setId(resultSet.getLong("id"));
                user.setRole_id(resultSet.getInt("role_id"));
            }
            else user = null;
            statement.close();

        } catch (Exception e){
            e.printStackTrace();
        }
        return user;

    }

    public static Blog getBlog(long id) {
        Blog blog = new Blog();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM news WHERE id = " + id + "");


            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) {

                String postDate = resultSet.getString("post_date");

                int categoryId = resultSet.getInt("category_id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                int id1 = resultSet.getInt("id");
                blog = new Blog(id1, postDate, categoryId, title, content);

            }

            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return blog;


    }

    public static void addComment(Comments comment) {
        System.out.println(comment.getComment());
        System.out.println(comment.getNews_id());
        System.out.println(comment.getUser_id());
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "insert into comments (post_date, user_id, news_id, comment) " +
                    "VALUES (NOW(), ?, ?, ?)");
            statement.setInt(1, comment.getUser_id());
            statement.setInt(2, comment.getNews_id());
            statement.setString(3, comment.getComment());
            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Comments> getAllComments(Long id){

        ArrayList<Comments> comments = new ArrayList<>();

        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT c.id, c.user_id, c.comment, c.news_id, u.full_name, u.email, c.post_date " +
                    "FROM comments c " +
                    "INNER JOIN users u ON c.user_id = u.id " +
                    "WHERE c.news_id = ? " +
                    "ORDER BY c.post_date DESC");

            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                Comments comment = new Comments();
                comment.setId((int)resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPost_date(resultSet.getString("post_date"));

                User user = new User();

                user.setId(resultSet.getLong("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                user.setEmail(resultSet.getString("email"));

                comment.setUser_id(Math.toIntExact(user.getId()));
                Blog blog = new Blog();
                blog.setId((int) resultSet.getLong("news_id"));
                comment.setNews_id(blog.getId());
                comments.add(comment);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return comments;

    }



    public static void deleteBlog(Long id) {
        try{

            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM news WHERE id = ?");

            statement.setLong(1, id);

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void saveBlog(Blog blog){
        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE news SET title = ?, content = ?" +
                    "WHERE id = ?");

            statement.setString(1, blog.getTitle());
            statement.setString(2, blog.getContent());
            statement.setLong(3, blog.getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void saveUser(User user){
        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE users SET password = ?, full_name = ?" +
                    "WHERE id = ?");

            statement.setString(1, user.getPassword());
            statement.setString(2, user.getFullName());
            statement.setLong(3, user.getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void addUser(User user) {
        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "insert into users (email, password, full_name, role_id) " +
                    "values (?, ?, ?, ?)");

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setInt(4, user.getRole_id());
            statement.executeUpdate();
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
