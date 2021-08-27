package pl.krzemien.javasocialnetwork.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    @NotBlank
    @Pattern(
            regexp = "^(?=.{4,50}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$",
            message = "zakres 4-50 znaków, znaki specjalne . i _ nie mogą być na początku, ani na końcu i nie mogą znajdować się po sobie")
    private String userName;

    @NotBlank
    @Size(min = 2, max = 50)
    private String firstName;

    @NotBlank
    @Size(min = 2, max = 50)
    private String lastName;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @NotNull
    @Past
    private LocalDate age;

    @NotNull
    private UserSex sex;

    @Column(unique = true)
    @NotBlank
    @Email
    private String email;

    @NotBlank
    private String password;

    private String role;

    @ManyToMany //wielu userow moze obserwowac wielu userow
    private List<User> following; //userzy obserwowani przez usera

    @ManyToMany //wielu userow obserwowanych jest przez wielu userow
    private List<User> followers; //userzy obserwujacy usera

    @Column(name = "created_on")
    private LocalDateTime createdOn;

    @Column(name = "updated_on")
    private LocalDateTime updatedOn;

    @PrePersist
    public void prePersist() {
        createdOn = LocalDateTime.now();
    }

    @PreUpdate
    public void preUpdate() {
        updatedOn = LocalDateTime.now();
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", age=" + age +
                ", sex=" + sex +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", createdOn=" + createdOn +
                ", updatedOn=" + updatedOn +
                '}';
    }
}
