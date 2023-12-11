package by.bsuir.wtlab3.core.dao;

import by.bsuir.wtlab3.core.entities.User;

import java.util.List;

/**
 * Interface of user logic dao
 * @author dreizer
 * @version 1.0
 */
public interface UserDao {
    /**
     * Method to get all users
     * @return List of all users
     */
    List<User> getUsers();

    /**
     * Method to update user for admin
     * @param id User ID
     * @param rating User new rating
     * @param isBanned User new ban state
     */
    void updateUser(int id, int rating, boolean isBanned);
}
