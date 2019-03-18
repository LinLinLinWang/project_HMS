// default package
// Generated 2018-6-3 20:03:23 by Hibernate Tools 5.2.3.Final
package niit.hospitalsys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * Answerquestion generated by hbm2java
 */
@Entity
@Table(name = "answerquestion", catalog = "hospital_system")
public class Answerquestion implements java.io.Serializable {

	private String registeId;
	private User user;
	private String question;
	private String answer;

	public Answerquestion() {
	}

	public Answerquestion(User user) {
		this.user = user;
	}

	public Answerquestion(User user, String question, String answer) {
		this.user = user;
		this.question = question;
		this.answer = answer;
	}

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "user"))
	@Id
	@GeneratedValue(generator = "generator")

	@Column(name = "RegisteId", unique = true, nullable = false, length = 40)
	public String getRegisteId() {
		return this.registeId;
	}

	public void setRegisteId(String registeId) {
		this.registeId = registeId;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "Question", length = 65535)
	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column(name = "Answer", length = 65535)
	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
