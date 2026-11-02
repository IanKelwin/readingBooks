import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Map;

public class Dijkstra {
   public static void main(String[] args) {
       HashMap<String, HashMap<String,Integer>> grafo = new HashMap<String, HashMap<String, Integer>>();
       
       // Criandoa Vértice inicio
       grafo.put("inicio", new HashMap<String, Integer>());
       // Definindo os vizinhos (Vértices adjacentes do Inicio)
       grafo.get("inicio").put("a", 6);
       grafo.get("inicio").put("b", 2);

       // Criando o Vértice a
       grafo.put("a", new HashMap<String, Integer>());
       // Definindo os vizinho do vértice A
       grafo.get("a").put("fim", 1);

       grafo.put("b", new HashMap<String, Integer>());

       grafo.get("b").put("a", 3);
       grafo.get("b").put("fim", 5);


       DijkstraImp dijkstra = new DijkstraImp("inicio", "fim", grafo);

       dijkstra.run();

       
       
   }
}


class DijkstraImp {

    private String start;
    private String end;

    private HashMap<String, HashMap<String, Integer>> grafo;

    private HashMap<String, String> tableOwner;

    private ArrayList<String>  processedVertex;

    public DijkstraImp(String start, String end, HashMap<String, HashMap<String, Integer>> grafo) {
        this.start = start;
        this.end = end;
        this.grafo = grafo;
        this.tableOwner = new HashMap<String, String>();
        this.processedVertex = new ArrayList<String>();

    }

    public void run() {
        
    }

    private HashMap<String, Integer> findVertexlowestWeight(HashMap<String, HashMap<String, Integer>> vertex) {
    }
    
}
