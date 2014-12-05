package com.iteso.sweng.Profile;

/**
 * Created by Daniel on 12/10/14.
 */
public class Profile {

    private int ID;
    private String name;
    private String lastname;
    private String email;
    private String password;
    private String phome;
    private String poffice;
    private String pmobile;
    private String nick;
    private boolean status;
    private String image;
    private String street1;
    private String street2;
    private String city;
    private String zip;
    private String state;
    private String country;

    public Profile() {

		this.ID=-1;
        this.name = null;
        this.lastname = null;
        this.email = null;
        this.password = null;
        this.phome = null;
        this.poffice = null;
        this.pmobile = null;
        this.nick = null;
        this.status = false;
        this.image = null;
        this.street1 = null;
        this.street2 = null;
        this.city = null;
        this.zip = null;
        this.state = null;
        this.country = null;

    }
	public int getID()
	{
		return this.ID;
	}
	public void setID(int id)
	{
		this.ID=id;
	}
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the lastname
     */
    public String getLastname() {
        return lastname;
    }

    /**
     * @param lastname the lastname to set
     */
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the phome
     */
    public String getPhome() {
        return phome;
    }

    /**
     * @param phome the phome to set
     */
    public void setPhome(String phome) {
        this.phome = phome;
    }

    /**
     * @return the poffice
     */
    public String getPoffice() {
        return poffice;
    }

    /**
     * @param poffice the poffice to set
     */
    public void setPoffice(String poffice) {
        this.poffice = poffice;
    }

    /**
     * @return the pmobile
     */
    public String getPmobile() {
        return pmobile;
    }

    /**
     * @param pmobile the pmobile to set
     */
    public void setPmobile(String pmobile) {
        this.pmobile = pmobile;
    }

    /**
     * @return the nick
     */
    public String getNick() {
        return nick;
    }

    /**
     * @param nick the nick to set
     */
    public void setNick(String nick) {
        this.nick = nick;
    }

    /**
     * @return the status
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public String getStreet1() {
        return street1;
    }

    public void setStreet1(String street1) {
        this.street1 = street1;
    }

    public String getStreet2() {
        return street2;
    }

    public void setStreet2(String street2) {
        this.street2 = street2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

}