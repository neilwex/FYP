import org.jopendocument.dom.OOUtils;
import org.jopendocument.dom.spreadsheet.SpreadSheet;

import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import java.io.File;
import java.io.IOException;

/**
 * Created by Neil on 15/01/2015.
 */
public class jOpenDocumentCreateTest {

    public static void main(String[] args) throws IOException {
/*

        // Create the data to save.
        final Object[][] data = new Object[6][2];
        data[0] = new Object[] { "January", 1 };
        data[1] = new Object[] { "February", 3 };
        data[2] = new Object[] { "March", 8 };
        data[3] = new Object[] { "April", 10 };
        data[4] = new Object[] { "May", 15 };
        data[5] = new Object[] { "June", 18 };
*/

        String[] columns = new String[] { "Student", "CS101", "CS102" };

        TableModel model = new DefaultTableModel(null, columns);

        // Save the data to an ODS file and open it.
        final File file = new File("results.ods");
        SpreadSheet.createEmpty(model).saveAs(file);
        System.out.println("New spreadsheet created");
        OOUtils.open(file);

    }
}
