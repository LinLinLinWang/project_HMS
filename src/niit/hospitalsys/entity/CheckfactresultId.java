// default package
// Generated 2018-6-3 20:03:23 by Hibernate Tools 5.2.3.Final
package niit.hospitalsys.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * CheckfactresultId generated by hbm2java
 */
@Embeddable
public class CheckfactresultId implements java.io.Serializable {

	private int phid;
	private String pexamineFact;

	public CheckfactresultId() {
	}

	public CheckfactresultId(int phid, String pexamineFact) {
		this.phid = phid;
		this.pexamineFact = pexamineFact;
	}

	@Column(name = "PHId", nullable = false)
	public int getPhid() {
		return this.phid;
	}

	public void setPhid(int phid) {
		this.phid = phid;
	}

	@Column(name = "PExamineFact", nullable = false, length = 20)
	public String getPexamineFact() {
		return this.pexamineFact;
	}

	public void setPexamineFact(String pexamineFact) {
		this.pexamineFact = pexamineFact;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CheckfactresultId))
			return false;
		CheckfactresultId castOther = (CheckfactresultId) other;

		return (this.getPhid() == castOther.getPhid()) && ((this.getPexamineFact() == castOther.getPexamineFact())
				|| (this.getPexamineFact() != null && castOther.getPexamineFact() != null
						&& this.getPexamineFact().equals(castOther.getPexamineFact())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getPhid();
		result = 37 * result + (getPexamineFact() == null ? 0 : this.getPexamineFact().hashCode());
		return result;
	}

}
