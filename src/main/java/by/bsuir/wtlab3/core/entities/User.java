package by.bsuir.wtlab3.core.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    private int rating;
    private String role;
    private boolean banned;
}
