import java.sql.*;
import java.text.DecimalFormat;

/**
 * Created by Neil on 15/01/2015.
 */
public class Database {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";

    //jdbc:mysql://localhost:3306/results_db
    static final String DB_URL = "jdbc:mysql://localhost:3306/results_db";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "Wexford96-";

    public static ResultSet rs;
    public static String sql;

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        try{
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();

            // Testing methods I've created

            getAllResults(stmt,rs);
            getAverageGrade(stmt, rs, "CS101");
            getMaxGrade(stmt, rs, "CS101");
            getMinGrade(stmt, rs, "CS101");
            getStdDev(stmt, rs, "CS101");

            //STEP 6: Clean-up environment
            //rs.close();
            stmt.close();
            conn.close();
        }catch(SQLException se){
            //Handle errors for JDBC
            se.printStackTrace();
        }catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        }finally{
            //finally block used to close resources
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException se2){
            }// nothing we can do
            try{
                if(conn!=null)
                    conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }//end try
        System.out.println("Goodbye!");
    }//end main


    public static void getAllResults (Statement s, ResultSet r) throws SQLException {
        System.out.println("Calling method getAllResults...");
        sql = "SELECT * FROM results";
        r = s.executeQuery(sql);

        // extract data from result set
        while(r.next()){
            //Retrieve by column name
            String student_num  = r.getString("student_num");
            String module_code  = r.getString("module_code");
            int ca_mark = r.getInt("ca_mark");
            int final_exam_mark = r.getInt("final_exam_mark");

            //Display values
            System.out.print("Student Number: " + student_num);
            System.out.print(", Module Code: " + module_code);
            System.out.print(", CS Mark: " + ca_mark);
            System.out.print(", Final Exam Mark: " + final_exam_mark);
            System.out.print(", Overall Grade: " + (ca_mark + final_exam_mark));
            System.out.println(", Pass/Fail?: " + (ca_mark + final_exam_mark >= 40 ? "Pass" : "Fail" ));
        }

        // close ResultSet
        r.close();
    }

    public static void getAverageGrade (Statement s, ResultSet r, String module) throws SQLException {
        System.out.println("Calling method getAverageGrade...");
        sql = "SELECT AVG(ca_mark + final_exam_mark) AS average FROM results WHERE module_code = \"" + module +"\"";
        r = s.executeQuery(sql);
        r.next();

        //Retrieve by column name
        String average  = r.getString("average");
        System.out.println("Overall Average: " + average);

        // close ResultSet
        r.close();
    }

    public static void getMaxGrade (Statement s, ResultSet r, String module) throws SQLException {
        System.out.println("Calling method getMaxGrade...");
        sql = "SELECT MAX(ca_mark + final_exam_mark) as max FROM results WHERE module_code = \"" + module +"\"";
        r = s.executeQuery(sql);
        r.next();

        //Retrieve by column name
        String max  = r.getString("max");
        System.out.println("Highest Grade Achieved: " + max);

        // close ResultSet
        r.close();
    }

    public static void getMinGrade (Statement s, ResultSet r, String module) throws SQLException {
        System.out.println("Calling method getMinGrade...");
        sql = "SELECT MIN(ca_mark + final_exam_mark) AS min FROM results WHERE module_code = \"" + module +"\"";
        r = s.executeQuery(sql);
        r.next();

        //Retrieve by column name
        String min  = r.getString("min");
        System.out.println("Lowest Grade Achieved: " + min);

        // close ResultSet
        r.close();
    }

    public static void getStdDev (Statement s, ResultSet r, String module) throws SQLException {
        System.out.println("Calling method getStdDev...");
        sql = "SELECT stddev(ca_mark + final_exam_mark) AS stddev FROM results WHERE module_code = \"" + module +"\"";
        r = s.executeQuery(sql);
        r.next();

        //Retrieve by column name
        double stddev  = r.getDouble("stddev");

        // Round deviation to 3 decimal points
        DecimalFormat df = new DecimalFormat("#.##");

        System.out.println("Standard Deviation: " + df.format(stddev));

        // close ResultSet
        r.close();
    }

} // end class
