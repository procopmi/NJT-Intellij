/*
 * Created on Dec 29, 2004
 *
 * This class encapsulates the logic to get the unique id and student status.
 */

package edu.shu; // CHANGE THIS TO YOUR OWN - edu.uti
import blackboard.data.user.*;
import java.util.regex.Pattern;

/**
 * @author SETON HALL UNIVERSITY
 *
 * NJ TRANSIT Module Business Logic
 */
public class StudentStatus

{
    private User user = null;
    public final static String universityCode = "XXXX"; //4-digit university code


    /**
     * Create unique ID for NJ TRANSIT. See specs.
     * As part of the unique id, we are using the CWID with
     * the shortname appended.
     * @param  userCtx  Blackboard user
     * @return String      the image at the specified URL
     */

    /**
     * Constructor for Student Status
     */
    public StudentStatus(User user) throws Exception
    {
        try
        {
            setUser(user);
        }
        catch(Exception e)
        {
            throw e;
        }
    }

    /**
     * Set user
     * @param u
     */

    private void setUser(User u)
    {
        user = u;
    }




    /**
     * Return user
     * @return User
     */
    private User getUser()
    {
        return user;
    }

    /**
     * Returns data stored in Street 1 of Blackboard User in the form of an array of Strings
     * @return String[]
     */
    private String [] getStreet1Data()
    {

        String userStatusData = getUser().getStreet1();
        Pattern p = Pattern.compile(";");
        return p.split(userStatusData);
    }

    /**
     * Return unique_id (student_id) passed in form data to NJ TRANSIT.  This ID enables
     * NJ TRANSIT to uniquely identify full time students once they register for a Quik-Tik account.
     * @return String
     */
    public String getUniqueId() throws Exception
    {
        String digits = "";
        try
        {
            digits = getCWID();
            //digits = (getUser().getPassword().substring(5)).substring(0,4);
        }
        catch (Exception e)
        {
            //this is just in case for some reason a user's password is short
            throw e;
        }
        //all user names have only 8 characters with the exception of
        //our test id for njtransit. We only want to return fnjtrans
        String returnName;
        if ((user.getUserName().length() > 8))
            returnName = (user.getUserName()).substring(0,8);
        else
            returnName = user.getUserName();
        return returnName + digits;
    }


    /**  Determine if the student is a current, fulltime student. If
     * the data is not present, the student is considered neither fulltime
     * nor current.  An "F" in the 13th occurance of street1 (which is items[12])
     * means that the student is or will be Full Time for the next semester.  The
     * mainframe returns this value based on a number of factors. (Ask Bob V about the
     * special indicator for NJTransit).	 *
     * @return boolean
     */
    public boolean isEligibleForDiscount()
    {
        boolean isOrWillBeFullTime = false;
        try
        {
            String items[] = getStreet1Data();
            if (items == null)
                return false;

            isOrWillBeFullTime = (((String)items[12]).equals("F") ? true : false);
        }
        catch(Exception e)
        {
            //do nothing. Default is to return false (below)
            //catch is necessary for those users with bad street1 data
        }
        //return isOrWillBeFullTime;
        return true;
    }

    /**
     * Returns Campus Wide ID
     * @return String
     */
    public String getCWID() throws Exception
    {
        try
        {
            String cwid = (getStreet1Data())[11];
            if (cwid != null && cwid.length() > 1 )
            {
                return cwid;
            }
            else
                throw new Exception("Problem with cwid for user: " + this.user.getUserName());
        }
        catch(Exception e)
        {
            throw e;
        }
    }
}