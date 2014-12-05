package com.iteso.sweng.Tanda;

/**
 * Created by Alejandro on 15/10/2014.
 */
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

public class Tanda {

    private int monto;
    private String name;
    private Organizer org;
    private boolean concluded;
    private boolean startNow;
    private ArrayList<User> tandaUsers = new ArrayList<User>();
    private ArrayList<User> tandaUsersSelected = new ArrayList<User>();
    Calendar cal = Calendar.getInstance();
    private int state =0;

    public int getState(){return state;}
    public void setState(int state) {this.state = state;}
    public void setOrganizer(Organizer organizer){
        this.org = organizer;
    }
    public Organizer getOrganizer() {
        return this.org;
    }
    public boolean isConcluded() {
        return concluded;
    }
    public void setConcluded(boolean concluded) {
        this.concluded = concluded;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getMonto() {
        return monto;
    }
    public void setMonto(int monto) {
        this.monto = monto;
    }

    public void randomizeUsers( Organizer org ){ //The only list that will be randomized will be the tandaUsers list. Whenever the organizer is done randomizing users, he can then use the method
//SelectUser to select the first element from tandaUsers and add it to tandaUsersSelected
        if(this.tandaUsers.isEmpty()){
            System.out.println("No users to randomize, please add users to the tanda.");
        }else {
            Collections.shuffle(tandaUsers);
            Collections.shuffle(tandaUsers);
            System.out.println("Users Randomized");
        }
    }

    public void StartNow(Organizer o){
        if(this.startNow == true){
            System.out.println("This Tanda has already started!");
        }else{
            this.startNow = true;
        }
    }

    public void ChangeName (Organizer o, String newName){
        if(this.concluded == true){
            return;
        }else{
            this.name = newName;
        }
    }

    public void clearAllUsers (Organizer o){
        if(this.concluded == true) {
            return;
        }else if(this.startNow == true){
            System.out.println("This Tanda has already started! You cannot delete any users!");
        }else{
            this.tandaUsersSelected.clear();
            this.tandaUsers.clear();
        }

    }



    public void AddUser (User u, Organizer org){ //Add a user to tandaUsers list.
        tandaUsers.add(u);
        return;
    }
    public void SelectUser(Organizer org){ //This is the reference list for the tandas. These users have been given a turn and it cannot be changed.
//Use this method to send the first user from tandaUsers list, to the selected list. The rest can still be randomized.
//The tanda refers to the Selected list.
        if(this.tandaUsers.isEmpty()){
            System.out.println("User list is empty");
        }
        this.tandaUsersSelected.add(this.tandaUsers.remove(0));
    }
    public void SelectUser(int i){ //Same as the above but with an index to select any other user.
        if(this.tandaUsers.isEmpty()){
            System.out.println("User list is empty");
        }
        this.tandaUsersSelected.add(this.tandaUsers.remove(i));
    }

    public void ChangeOrganizer(User user){

        if(this.tandaUsers.isEmpty()){
            System.out.println("User list is empty");
        }

        else if (this.tandaUsers.contains(user)){
           Organizer org = Organizer.becomeAnOrganizer(user);
            this.org=org;

        }
        else
        {
            System.out.println("User was not found in this Tanda");

        }
        return;
    }
    public  Tanda (String name, int monto, Organizer org){ //Creates a new tanda with an amount and a name, needs an organizer

        setName(name);
        setMonto(monto);
        setOrganizer(org);
    }

    public Tanda createNewTanda(String name, int monto, Organizer organizer){
        return new Tanda(name, monto, organizer);
    }
    public boolean StartTanda (Organizer organizer, int day, int month, int year){ //This method checks a date from the user and compares it to the system date. If the date is valid, an instance of
//calendar named "cal" will store the user date.
        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        int currentMonth = calendar.get(Calendar.MONTH);
        int currentDay = calendar.get(Calendar.DAY_OF_MONTH);
        int start = calendar.compareTo(cal);
        if(organizer==null){
            System.out.println("Not an organizer");
            return false;
        }
        if(concluded){
            System.out.println("The Tanda you're trying to start has already concluded");
            return false;
        }
        if (day <= 0 || month <= 0 || month >= 13 || year < currentYear) {
            System.out.println("Error in date, Check day/month/day");
            return false;
        }
        int dy = year - currentYear;
        int dm = month - currentMonth;
        int dd = day - currentDay;
        if (dy == 0 && dm == 0 && dd == 0) {
            cal.set(year,month,day);
            System.out.println("Date set successfully");
            return true;
        }
        if (dy == 0) {
            if (dm == 0 || dm > 0) // >=0
                if (dd == 0 || dd > 0) // >=0
                    System.out.println("SAME YEAR, FUTURE DATE");
            cal.set(year,month,day);
            System.out.println("Date set successfully");
            return true;
        }
        if(dy==1) if (dm <= 0) if (dd <= 0) {
            System.out.println("FUTURE YEAR, FUTURE DATE");
            cal.set(year,month,day);
            System.out.println("Date set successfully");
            return true;
        }
        if(start == 0){
            System.out.println("Starting Now...");
            startNow = true;
        }
        return false;
    }
}
