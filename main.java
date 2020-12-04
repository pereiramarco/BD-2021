import java.io.*;
import java.time.LocalDateTime;
import java.util.*;

public class main {
    static String NOMETABELA="Bilhete";
    static String VACANIVET="";
    static Map<Integer,List<Quad<Integer,Integer,Integer,Integer>>> ESPECIEVACINA = new HashMap<>();
    static Map<Integer,List<Animal>> arvores = new HashMap<>();
    static Map<Integer,Triple<Double,Double,Double>> species = new HashMap<>();
    static Map<String, int[]> biomeDist = new HashMap<>();
    static Map <Integer,int[]> lista = new HashMap<>();
    static String bancos[] = {"0007", "0010", "0018", "0019", "0022", "0023", "0025", "0032", "0033", "0034", "0035", "0235", "0036", "0038", "0043", "0045", "0046", "0059", "0061", "0065", "0079", "0193", "0269", "0781", "5180"};
    static String petnames[] = {"Sonya", "Dove", "Fang", "Fuzz", "Chloe", "Bonkers", "Crook", "Donut", "Spectral", "Teapot", "Hugo", "Shredder", "Tinkerbell", "Sugar", "Galileo", "Gumby", "Hunter", "Chakra", "Zion", "Sally"};
    static String first_name[] = {"Águeda", "Amélia", "Ângela", "Alessandro", "Alessandra", "Alexandre", "Aline", "Antônio", "Breno", "Bruna", "Carlos", "Carla", "Célia", "Cecília", "César", "Danilo", "Dalila", "Deneval", "Eduardo", "Eduarda", "Esther", "Elísio", "Fábio", "Fabrício", "Fabrícia", "Félix", "Felícia", "Feliciano", "Frederico", "Fabiano", "Gustavo", "Guilherme", "Gúbio", "Heitor", "Hélio", "Hugo", "Isabel", "Isabela", "Ígor", "João", "Joana", "Júlio César", "Júlio", "Júlia", "Janaína", "Karla", "Kléber", "Lucas", "Lorena", "Lorraine", "Larissa", "Ladislau", "Marcos", "Meire", "Marcelo", "Marcela", "Margarida", "Mércia", "Márcia", "Marli", "Morgana", "Maria", "Norberto", "Natália", "Nataniel", "Núbia", "Ofélia", "Paulo", "Paula", "Pablo", "Pedro", "Raul", "Rafael", "Rafaela", "Ricardo", "Roberto", "Roberta", "Sílvia", "Sílvia", "Silas", "Simão", "Suélen", "Sara", "Salvador", "Sirineu", "Talita", "Tertuliano", "Vicente", "Víctor", "Vitória", "Yango", "Yago", "Yuri", "Washington", "Warley"};
    static String last_name[] = {"Araújo", "D'cruze", "Estéves", "Silva", "Souza", "Carvalho", "Santos", "Reis", "Xavier", "Franco", "Braga", "Macedo", "Batista", "Barros", "Moraes", "Costa", "Pereira", "Carvalho", "Melo", "Lemos", "Saraiva", "Nogueira", "Oliveira", "Martins", "Moreira", "Albuquerque"};
    static String emails[] = {"@hotmail.com", "@gmail.com", "@yahoo.com", "@outlook.com"};
    static String nums[] = {"91", "92", "93", "96", "259", "253", "256"};

    static void inicia() {
        species.put(1, new Triple<Double, Double, Double>(0.5, 0.82, 14.0));
        species.put(2, new Triple<Double, Double, Double>(1.2, 2.5, 240.0));
        species.put(3, new Triple<Double, Double, Double>(1.0, 0.42, 3.0));
        species.put(4, new Triple<Double, Double, Double>(1.0, 0.65, 18.0));
        species.put(5, new Triple<Double, Double, Double>(0.65, 1.06, 23.0));
        species.put(6, new Triple<Double, Double, Double>(0.73, 0.73, 6.0));
        species.put(7, new Triple<Double, Double, Double>(1.0, 0.4, 90.0));
        species.put(8, new Triple<Double, Double, Double>(2.0, 1.8, 300.0));
        species.put(9, new Triple<Double, Double, Double>(0.2, 2.0, 15.0));
        species.put(10, new Triple<Double, Double, Double>(0.1, 0.33, 3.8));
        species.put(11, new Triple<Double, Double, Double>(2.0, 4.0, 3500.0));
        species.put(12, new Triple<Double, Double, Double>(1.9, 3.5, 2000.0));
        species.put(13, new Triple<Double, Double, Double>(0.2, 0.8, 113.0));
        species.put(14, new Triple<Double, Double, Double>(5.0, 4.7, 1900.0));
        species.put(15, new Triple<Double, Double, Double>(0.35, 0.1, 0.9));
        species.put(16, new Triple<Double, Double, Double>(1.1, 3.1, 260.0));
        species.put(17, new Triple<Double, Double, Double>(1.1, 3.3, 300.0));
        species.put(18, new Triple<Double, Double, Double>(0.2, 0.38, 6.0));
        species.put(19, new Triple<Double, Double, Double>(0.3, 0.22, 2.0));
        species.put(20, new Triple<Double, Double, Double>(1.6, 3.0, 450.0));
        species.put(21, new Triple<Double, Double, Double>(1.5, 2.8, 600.0));
        species.put(22, new Triple<Double, Double, Double>(0.3, 4.5, 450.0));
        species.put(23, new Triple<Double, Double, Double>(0.15, 4.0, 30.0));
        species.put(24, new Triple<Double, Double, Double>(0.25, 0.35, 0.162));
        species.put(25, new Triple<Double, Double, Double>(1.15, 1.3, 90.0));
        species.put(26, new Triple<Double, Double, Double>(0.25, 1.0, 1.7));
        species.put(27, new Triple<Double, Double, Double>(0.25, 0.89, 1.4));
        species.put(28, new Triple<Double, Double, Double>(0.2, 0.3, 0.18));
        species.put(29, new Triple<Double, Double, Double>(1.95, 3.5, 1000.0));
        species.put(30, new Triple<Double, Double, Double>(0.2, 2.5, 30.0));
        species.put(31, new Triple<Double, Double, Double>(0.25, 0.85, 2.0));
        species.put(32, new Triple<Double, Double, Double>(0.2, 2.5, 6.0));
        species.put(33, new Triple<Double, Double, Double>(1.8, 3.4, 900.0));
        species.put(34, new Triple<Double, Double, Double>(1.8, 3.0, 600.0));
        species.put(35, new Triple<Double, Double, Double>(1.5, 2.0, 92.0));
        species.put(36, new Triple<Double, Double, Double>(0.4, 3.0, 150.0));
        species.put(37, new Triple<Double, Double, Double>(3.7, 7.5, 7500.0));
        species.put(38, new Triple<Double, Double, Double>(0.3, 5.5, 1000.0));
        species.put(39, new Triple<Double, Double, Double>(0.95, 0.4, 60.0));
        species.put(40, new Triple<Double, Double, Double>(0.94, 1.3, 43.0));
        species.put(41, new Triple<Double, Double, Double>(1.9, 1.0, 55.0));
        species.put(42, new Triple<Double, Double, Double>(1.45, 0.3, 2.8));
        species.put(43, new Triple<Double, Double, Double>(0.6, 3.9, 500.0));
        species.put(44, new Triple<Double, Double, Double>(2.0, 1.7, 180.0));
        species.put(45, new Triple<Double, Double, Double>(1.6, 5.5, 4500.0));
        species.put(46, new Triple<Double, Double, Double>(0.2, .2, 9.0));
        species.put(47, new Triple<Double, Double, Double>(0.2, 2.0, 5.0));
        species.put(48, new Triple<Double, Double, Double>(1.0, 1.7, 120.0));
        species.put(49, new Triple<Double, Double, Double>(0.7, 0.3, 3.0));
        species.put(50, new Triple<Double, Double, Double>(1.3, 3.0, 450.0));
        biomeDist.put("Savana", new int[]{2, 41, 40, 37, 33, 20, 18, 15, 14, 12, 11});
        biomeDist.put("Floresta", new int[]{6, 35, 1});
        biomeDist.put("Floresta Tropical", new int[]{44, 39, 3, 4, 7, 47, 46, 32, 30, 19, 24, 26, 27, 31});
        biomeDist.put("Pântano", new int[]{28, 23, 22, 13, 9});
        biomeDist.put("Planície Temperada", new int[]{29, 16, 8});
        biomeDist.put("Pólo", new int[]{49, 50});
        biomeDist.put("Oceano", new int[]{43, 10});
        biomeDist.put("Rio", new int[]{45, 42, 38});
        biomeDist.put("Montanha", new int[]{48, 25, 21, 17, 5});
        biomeDist.put("Deserto", new int[]{36, 34});
        lista.put(1, new int[]{21, 50, 36});
        lista.put(2, new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50});
        lista.put(3, new int[]{1, 2, 5, 16, 17, 40, 48});
        lista.put(4, new int[]{3, 6, 15});
        lista.put(5, new int[]{21, 50});
        lista.put(6, new int[]{3, 4, 7, 40, 44});
        lista.put(7, new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50});
        lista.put(8, new int[]{8, 14, 29, 33, 34, 45});
        lista.put(9, new int[]{25, 8});
        lista.put(10, new int[]{34});
        lista.put(11, new int[]{8, 20, 45});
        lista.put(12, new int[]{10, 11, 12, 43});
        lista.put(13, new int[]{24, 26, 27, 31, 41, 42});
        lista.put(14, new int[]{43});
        lista.put(15, new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 44, 45, 46, 47, 48, 49, 50});
    }


    public static class Animal {
        public int ano;
        public int idAn;
        public boolean sexo;
        public boolean mae;
        public boolean pai;

        public Animal(int first, int animal,boolean second) {
            this.ano = first;
            this.sexo = second;
            this.idAn=animal;
            this.pai = this.mae = false;
        }
    }



    public static class Triple<T, U, V> {

        private final T first;
        private final U second;
        private final V third;

        public Triple(T first, U second, V third) {
            this.first = first;
            this.second = second;
            this.third = third;
        }

        public T getFirst() { return first; }
        public U getSecond() { return second; }
        public V getThird() { return third; }
    }

    public static class Quad<T, U, V, W> {

        public final T first;
        public final U second;
        public final V third;
        public final W forth;

        public Quad(T first, U second, V third, W forth) {
            this.first = first;
            this.second = second;
            this.third = third;
            this.forth = forth;
        }
    }

    public static String getRelacoes() {
        String relac="";
        for (List<Animal> a : arvores.values()) {
            for (Animal aa : a) {
                for (Animal aaa : a) {
                    if (aa.idAn!=aaa.idAn) {
                        if (aaa.ano>aa.ano+2) {
                            if (aa.sexo && !aaa.pai) {
                                aaa.pai=true;
                                relac = relac.concat("INSERT INTO Animal_has_Animal VALUES ("+aa.idAn+","+aaa.idAn+");\n");
                            }
                            else if (!aa.sexo && !aaa.mae) {
                                aaa.mae=true;
                                relac = relac.concat("INSERT INTO Animal_has_Animal VALUES ("+aa.idAn+","+aaa.idAn+");\n");
                            }
                        }
                    }
                }
            }
        }
        return relac;
    }


    public static String getRandomTicket(Random rand) {
        int ano = rand.nextInt(30)+1990;
        int mês = rand.nextInt(12)+1;
        int dia = rand.nextInt(27+(mês==2 ? 1 : 3))+1;
        String nascimento = "'"+ano+"-"+mês+"-"+dia+"'";

        return nascimento+","+(rand.nextInt(6)+1);
    }

    public static String getRandomNameAnimal(Random rand) {
       return petnames[rand.nextInt(petnames.length)];
    }
    public static String getRandomAnimal(Random rand,int idEspecie,int padrinho,int animal) {
        String ANIMAL ="";

        Triple<Double,Double,Double> info = species.get(idEspecie);
        String gender = rand.nextBoolean() ? "\"Masculino\"" : "\"Feminino\"";
        int vivo = rand.nextInt(100)>79 ? 0 : 1;
        int ano = rand.nextInt(30)+1990;
        List<Animal> l;
        if (arvores.containsKey(idEspecie)) {
            l = arvores.get(idEspecie);
        }
        else {
            l = new ArrayList<>();
        }
        l.add(new Animal(ano,animal,gender.equals("\"Masculino\"")));
        arvores.put(idEspecie,l);
        int mês = rand.nextInt(12)+1;
        int dia = rand.nextInt(27+(mês==2 ? 1 : 3))+1;
        String nascimento = "'"+ano+"-"+mês+"-"+dia+"'";

        List<Quad<Integer,Integer,Integer,Integer>> ll = ESPECIEVACINA.get(idEspecie);

        for (Quad<Integer,Integer,Integer,Integer> q : ll) {
            int vet = rand.nextInt(25)+1;
            int anoV=ano;
            int mesV = mês+q.second;
            for (int contador=0;contador<q.forth;contador++) {
                while (mesV>12) {
                    anoV++;
                    mesV-=12;
                }
                if (anoV>2020 | mesV>11) break;
                String data = "'"+ anoV +"-"+ mesV +"-1'";
                VACANIVET = VACANIVET.concat("INSERT INTO Animal_has_Vacina_has_Veterinario VALUES ("+animal+","+q.first+","+vet +"," + data +");\n");
                mesV+=q.third;
            }
        }

        double altura=info.getFirst()*(0.95+rand.nextDouble()*0.1);
        double comprimento=info.getSecond()*(0.9+rand.nextDouble()*0.2);
        double peso=info.getThird()*(0.8+rand.nextDouble()*0.4)*(gender.equals("\"Feminino\"") ? 0.90 : 1);

        String cS=String.valueOf(comprimento).substring(0,4);
        String aS=String.valueOf(altura).substring(0,4);
        String pS;
        if (peso>=1000)
            pS=String.valueOf(peso).substring(0,8);
        else if (peso>=100)
            pS=String.valueOf(peso).substring(0,7);
        else if (peso>=10)
            pS=String.valueOf(peso).substring(0,6);
        else
            pS=String.valueOf(peso).substring(0,5);
        String nameAnimal="";
        if (padrinho>0) {
            nameAnimal="\""+getRandomNameAnimal(rand).concat("\",");
        }
        ANIMAL = ANIMAL.concat(gender+","+nameAnimal+nascimento+","+aS+","+cS+","+pS+","+vivo+",");
        if (padrinho>0) {
            ANIMAL = ANIMAL.concat(padrinho + ",");
        }
        return ANIMAL;
    }

    public static Map.Entry<String,String> getRecintos(Random rand) {
        String RECINTO = "";
        int nanimas=1;
        int pad=1;
        String ANIMAL = "";
        int i=1,k=0,j=0,zona;
        for (Map.Entry<String,int[]> e : biomeDist.entrySet()) {
            for (Integer f : e.getValue()) {
                if (f==49 || f==50) zona=7;
                else if (f==43 || f== 10) zona=9;
                else if (f==4 || f==12 || f==18 || f==31 || f==7) zona=8;
                else if (f==6 || f==35) zona=6;
                else if (f==9 || f== 13 || f==19 || f==23|| f==30 || f==32 || f==46 || f==47) zona=4;
                else if (f==1 || f==5 || f==16 || f==17 || f==40 || f==48) zona=3;
                else if (f==3 || f==39 || f==44) zona=2;
                else if (f==24 || f==26 || f== 27 || f==42) zona=1;
                else zona=5;
                String size = String.valueOf(rand.nextFloat()*4 ).substring(0,3);
                RECINTO = RECINTO.concat("INSERT INTO Recinto VALUES ("+i+","+j*10+","+k*10+","+size+",\""+e.getKey()+"\","+zona+"); -- "+f+"\n");
                j++;
                if (j==5) {
                    k++;
                    j=0;
                }
                int n=rand.nextInt(10)+1;
                for (int l=0;l<n;l++) {
                    int idPadrinho = 0;
                    if (rand.nextInt(100) > 75) {
                        if (pad==26) pad=1;
                        idPadrinho = pad;
                        ANIMAL=ANIMAL.concat("INSERT INTO Animal VALUES (");
                        pad++;
                    }
                    else {
                        ANIMAL=ANIMAL.concat("INSERT INTO Animal (idAnimal,genero,data_nascimento,altura,comprimento,peso,vivo,Recinto_ID,Especie_idEspecie) VALUES (");


                    }
                    String animal=getRandomAnimal(rand,f,idPadrinho,nanimas);
                    ANIMAL=ANIMAL.concat(String.valueOf(nanimas).concat(","+animal+i+","+f+");\n"));
                    nanimas++;
                }
                i++;
            }
        }
        return new AbstractMap.SimpleEntry<>(RECINTO, ANIMAL);
    }

    public static String getRandomName(Random rand) {
        String nome = first_name[rand.nextInt(first_name.length)]+" "+last_name[rand.nextInt(last_name.length)];
        return nome;
    }

    public static String getRandomNIF(Random rand) {
        String NIF ="";
        for (int i=0;i<9;i++) {
            NIF = NIF.concat(String.valueOf(rand.nextInt(10)));
        }
        return NIF;
    }

    public static String getRandomNIB(Random rand) {
        String NIB="";
        int i=rand.nextInt(25);
        NIB = NIB.concat(bancos[i]);
        for (int j=0;j<16;j++) {
            int k=rand.nextInt(10);
            NIB = NIB.concat(String.valueOf(k));
        }
        return NIB;
    }

    public static String getRandomCC(Random rand) {
        String CC="";
        for (int j=0;j<8;j++) {
            CC=CC.concat(String.valueOf(rand.nextInt(10)));
        }
        CC = CC.concat(" ");
        CC = CC.concat(String.valueOf(rand.nextInt(9)+1));
        CC = CC.concat(" ");

        String alphabet = "ZYX";
        for (int i = 0; i < 2; i++) {
            CC = CC.concat(String.valueOf(alphabet.charAt(rand.nextInt(alphabet.length()))));
        }

        CC = CC.concat(String.valueOf(rand.nextInt(2)+1));

        return CC;
    }

    public static String getRandomEMAIL(Random rand,String name) {
       name = name.toLowerCase().replace(" ","");
        return "\"" + name + rand.nextInt(1000) +emails[rand.nextInt(emails.length)]+"\"";
    }

    public static String getRandomNum(Random rand) {
        String num;
        for (num = nums[rand.nextInt(nums.length)];num.length()<10;) {
            num=num.concat(String.valueOf(rand.nextInt(10)));
        }
        return "\""+num+"\"";
    }

    public static String getRandomCont(Random rand,String name) {
        int n = rand.nextInt(100);
        if (n>60) {
            return getRandomEMAIL(rand,name);
        }
        else {
            return getRandomNum(rand);
        }
    }


    public static String getRandomVacinaEEspecie(Random rand) {
        String vEe="";
        Boolean b1,b2;
        String dd1,dd2;
        for (Map.Entry<Integer,int[]> e : lista.entrySet()) {
            for (int especie : e.getValue()) {
                int limite = rand.nextInt(24);
                int dNN=rand.nextInt(5)+1;
                int espaco = (rand.nextInt(19) + 6) * (dNN==1? 0 : 1);
                String dQ = String.valueOf(rand.nextInt(15));
                String idd;
                if (dNN==1)
                    idd = "(Especie_idEspecie,Vacina_idVacina,limite_temporal,doses_necessarias,dosagem) ";
                else idd="";
                List<Quad<Integer,Integer,Integer,Integer>> lis;
                if (ESPECIEVACINA.containsKey(especie)) {
                    lis = ESPECIEVACINA.get(especie);
                }
                else {
                    lis = new ArrayList<>();
                }
                lis.add(new Quad<>(e.getKey(),limite,espaco,dNN));
                ESPECIEVACINA.put(especie,lis);
                String space="";
                if (espaco!=0) {
                    space = espaco+ ",";
                }
                vEe = vEe.concat("INSERT INTO Especie_has_Vacina "+ idd+ "VALUES ("+especie+","+e.getKey()+","+limite+","+space+dNN+","+dQ+");\n");
            }
        }

        return vEe;
    }

    public static void main(String[] args) throws IOException {
        int id;
        String padrinhos="";
        String pc="";
        Random rand = new Random();
        rand.setSeed(LocalDateTime.now().hashCode()*rand.nextLong());

        File myObj = new File("PovoamentoBD.sql");
        myObj.createNewFile();
        FileWriter myWriter = new FileWriter("PovoamentoBD.sql",true);
        BufferedWriter bw = new BufferedWriter(myWriter);
        PrintWriter out = new PrintWriter(bw);

        inicia();

        for (id=1;id<26;id++) {
            String name = getRandomName(rand);
            padrinhos = padrinhos.concat("INSERT INTO Padrinho VALUES ("+id+",\""+name+"\",\""+getRandomNIB(rand)+"\",\""+getRandomCC(rand)+"\",\""+getRandomNIF(rand)+"\");\n");
            int random = rand.nextInt(3)+2;
            for (int y=1;y<random;y++) {
                pc = pc.concat("INSERT INTO Contacto_Padrinho VALUES ("+id+","+getRandomCont(rand,name)+");\n");
            }
        }

        padrinhos = padrinhos.concat("\n");
        pc = pc.concat("\n");

        for (id=1;id<26;id++) {
            String name = getRandomName(rand);
            padrinhos = padrinhos.concat("INSERT INTO Veterinario VALUES ("+id+",\""+name+"\");\n");//",\""+getRandomNIB(rand)+"\",\""+getRandomCC(rand)+"\",\""+getRandomNIF(rand)+"\");\n");
            int random = rand.nextInt(3)+2;
            for (int y=1;y<random;y++) {
                pc = pc.concat("INSERT INTO Contacto_Veterinario VALUES ("+id+","+getRandomCont(rand,name)+");\n");
            }
        }

        out.print(padrinhos+"\n");
        out.print(pc+"\n");

        out.print(getRandomVacinaEEspecie(rand)+"\n");

        Map.Entry<String,String> p = getRecintos(rand);
        out.print(p.getKey()+"\n"+p.getValue()+"\n");
        out.print(getRelacoes()+"\n");
        out.print(VACANIVET);

        for  (id =1 ;id<10001; id++) {
            out.print("INSERT INTO Bilhete VALUES ("+id+","+getRandomTicket(rand)+");\n");
        }

        out.close();

    }
}
