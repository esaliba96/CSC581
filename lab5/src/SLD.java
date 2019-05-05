import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

public class SLD {
    public static void main(String[] args) {
        File file = new File("/home/elie/Documents/Github/CSC581/lab5/src/input");
        List<Proposition> props = new LinkedList<>();
        List<Rule> rules = new LinkedList<>();

        Scanner reader = new Scanner(System.in);  // Reading from System.in
        System.out.println("Enter a target: ");
        String target = reader.next(); // Scans the next token of the input as an int.
        reader.close();

        try {
            BufferedReader br = new BufferedReader(new FileReader(file));
            String st, st1, st2;
            while ((st = br.readLine()) != null) {
                st1 = st.split("->")[0];
                if (st1.length() == 1) {
                    props.add(new Proposition(st1));
                } else {
                    st2 = st.split("->")[1];
                    Rule r = new Rule(new Proposition(st2));
                    String[] values = st1.split(",");
                    for (String v : values) {
                        r.addDependency(v);
                    }
                    rules.add(r);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

      boolean flag = false;
        for (Rule r : rules) {
            for (String p : r.dependencies) {
                if (props.stream().anyMatch(o -> o.getName().equals(p))) {
                    flag = true;
                } else {
                    flag = false;
                    break;
                }
            }
            if (flag)
                props.add(r.target);
        }
        System.out.println(props.stream().anyMatch(o -> o.getName().equals(target)));
    }
}

class Proposition {
    String name;
    boolean val;

    Proposition(String name) {
        this.name  = name;
        this.val = true;
    }

    String getName() {
        return name;
    }
    
}

class Rule {
    List<String> dependencies;
    Proposition target;

    Rule(Proposition target) {
        this.target = target;
        this.dependencies = new LinkedList<>();
    }

    void addDependency(String p) {
        this.dependencies.add(p);
    }
}
