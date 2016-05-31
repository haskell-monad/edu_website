package cn.freeteam.cms.model;

import java.io.Serializable;

public class Templet implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column templet.id
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    private String id;
    public static String STATE_Y="1";//有效
    public static String STATE_N="0";//无效
    public static String STATE_DEL="3";//删除

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column templet.name
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column templet.state
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    private String state;
    private String stateStr;
    private String noDel;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column templet.orderNum
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    private Integer ordernum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column templet.useSites
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    private String usesites;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column templet.useSiteNames
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    private String usesitenames;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column templet.adduser
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    private String adduser;


    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column templet.id
     *
     * @return the value of templet.id
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column templet.id
     *
     * @param id the value for templet.id
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column templet.name
     *
     * @return the value of templet.name
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column templet.name
     *
     * @param name the value for templet.name
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column templet.state
     *
     * @return the value of templet.state
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column templet.state
     *
     * @param state the value for templet.state
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column templet.orderNum
     *
     * @return the value of templet.orderNum
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public Integer getOrdernum() {
        return ordernum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column templet.orderNum
     *
     * @param ordernum the value for templet.orderNum
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public void setOrdernum(Integer ordernum) {
        this.ordernum = ordernum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column templet.useSites
     *
     * @return the value of templet.useSites
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public String getUsesites() {
        return usesites;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column templet.useSites
     *
     * @param usesites the value for templet.useSites
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public void setUsesites(String usesites) {
        this.usesites = usesites == null ? null : usesites.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column templet.useSiteNames
     *
     * @return the value of templet.useSiteNames
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public String getUsesitenames() {
        return usesitenames;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column templet.useSiteNames
     *
     * @param usesitenames the value for templet.useSiteNames
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public void setUsesitenames(String usesitenames) {
        this.usesitenames = usesitenames == null ? null : usesitenames.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column templet.adduser
     *
     * @return the value of templet.adduser
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public String getAdduser() {
        return adduser;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column templet.adduser
     *
     * @param adduser the value for templet.adduser
     *
     * @mbggenerated Sun Feb 12 21:38:16 CST 2012
     */
    public void setAdduser(String adduser) {
        this.adduser = adduser == null ? null : adduser.trim();
    }


	public String getStateStr() {
		if (STATE_DEL.equals(state)) {
			return "已删除";
		}else if (STATE_N.equals(state)) {
			return "否";
		}else if (STATE_Y.equals(state)) {
			return "是";
		}
		return stateStr;
	}

	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}

	public String getNoDel() {
		return noDel;
	}

	public void setNoDel(String noDel) {
		this.noDel = noDel;
	}
}