import java.util.HashMap;
import java.util.stream.Collectors;

class RnaTranscription {

  private static final HashMap<Character, String> rnaMap = new HashMap<>(){{
    put('G', "C");
    put('C', "G");
    put('T', "A");
    put('A', "U");
  }};

  String transcribe(String dnaStrand) {

    String rna = "";
    for (char n : dnaStrand.toCharArray()) {
      rna += rnaMap.get(n);
    }

    return rna;

  }

}
