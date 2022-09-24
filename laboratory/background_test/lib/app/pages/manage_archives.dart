import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ManageArchives extends StatefulWidget {
  const ManageArchives({super.key});

  @override
  State<ManageArchives> createState() => _ManageArchivesState();
}

class _ManageArchivesState extends State<ManageArchives> {
  File? file;

  void deleteFile() async {
    // is working = true
    try {
      file = File("/storage/emulated/0/image.jpg");

      var res = await file?.delete(recursive: false);
      debugPrint("$res");
    } catch (e) {
      print('erro no delete file: $e');
    }
  }

  void createDirectory() async {
    // is working true;

    try {
      debugPrint("atual: ${Directory.current}");
      Directory dir = Directory("/storage/emulated/0/Manga Libray/manga");
      var res = await dir.create(recursive: false);
      debugPrint("dir: $res");
    } catch (e) {
      debugPrint("erro no createDirectory: $e");
    }
  }

  void deleteDirectory() async {
    try {
      Directory dir = Directory("/storage/emulated/0/Manga Libray/manga");
      dir.delete(recursive: true).whenComplete(() => print("deletado!"));
    } catch (e) {
      debugPrint("erro no delete Directory: $e");
    }
  }

  void createFileBackup() async {
    try {
      File file = File("/storage/emulated/0/Manga Libray/manga/backup.json");
      if (file.existsSync()) {
        debugPrint("este arquivo existe!");
      } else {
        Map<String, dynamic> data = {
          "tipo": "vertical",
          "exists": true,
          "num": [1, 3, 6],
          "txt": '''classe GZipCodecSegurança nula
O GZipCodec codifica bytes brutos em bytes compactados GZip e decodifica bytes compactados GZip em bytes brutos.

A diferença entre ZLibCodec e GZipCodec é que o GZipCodec envolve os ZLibbytes compactados em GZipquadros.

Herança
Objeto Codec < List < int > , List < int > > GZipCodecName
Construtores
GZipCodec ( { int level = ZLibOption.defaultLevel , int windowBits = ZLibOption.defaultWindowBits , int memLevel = ZLibOption.defaultMemLevel , int strategy = ZLibOption.strategyDefault , List < int > ? dictionary , bool raw = false , bool gzip = true } )
Propriedades
decodificador → ZLibDecoder
Obtenha um ZLibDecoder para decodificar GZipdados compactados.
somente leitura, substituir
dicionário → Lista < int > ?
Dicionário de compressão inicial.
final
codificador → ZLibEncoder
Obtenha um ZLibEncoder para codificação de GZipdados compactados.
somente leitura, substituir
gzip → bool
Quando true, GZipos quadros serão adicionados aos dados compactados.
final
hashCode → int
O código hash para este objeto.
somente leitura, herdado
invertido → Codec < List < int > , List < int > >
Inverte this.
somente leitura, herdado
nível → int
O nível de compactação pode ser definido no intervalo de -1..9, 6sendo o nível de compactação padrão. Os níveis acima 6terão taxas de compactação mais altas ao custo de mais uso de CPU e memória. Os níveis abaixo 6usarão menos CPU e memória ao custo de taxas de compactação mais baixas.
final
memNível → int
Especifica quanta memória deve ser alocada para o estado de compactação interna. 1usa memória mínima, mas é lento e reduz a taxa de compactação; 9usa memória máxima para velocidade ideal. O valor padrão é 8.
final
cru → bool
Quando true, deflate gera dados brutos sem cabeçalho ou trailer zlib e não computará um valor de verificação adler32
final
runtimeType → Tipo
Uma representação do tipo de tempo de execução do objeto.
somente leitura, herdado
estratégia → int
Ajusta o algoritmo de compressão. Use o valor ZLibOption.strategyDefault para dados normais, ZLibOption.strategyFiltered para dados produzidos por um filtro (ou preditor), ZLibOption.strategyHuffmanOnly para forçar apenas a codificação Huffman (sem correspondência de string) ou ZLibOption.strategyRle para limitar as distâncias de correspondência a um (executar -codificação de comprimento).
final
windowBits → int
Baseie dois logaritmos do tamanho da janela (o tamanho do buffer do histórico). Deve estar no intervalo 8..15. Valores maiores resultam em melhor compactação às custas do uso de memória. o valor padrão é15
final
Métodos
decodificar ( Lista < int > codificado ) → Lista < int >
Decodifica encodeddados.
herdado
codificar ( List < int > input ) → List < int >
Codifica input.
herdado
fusível < R > ( Codec < List < int > , R > other ) → Codec < List < int > , R >
Fusíveis thiscom other.
herdado
noSuchMethod ( invocação de invocação ) → dinâmico
Invocado quando um método ou propriedade inexistente é acessado.
herdado
toString ( ) → String
Uma representação de string deste objeto.
herdado
Operadores
operador == ( outro objeto ) → bool
O operador de igualdade.
herdado''',
          "txt2": '''
Um objeto de comunicação HTTP bidirecional para aplicativos cliente ou servidor.

O fluxo expõe as mensagens recebidas. Uma mensagem de texto será do tipo Stringe uma mensagem binária será do tipo List<int>.

Tipos implementados
FluxoStreamSink
Extensões disponíveis
StreamExtensionsStreamSinkExtensions
Construtores
WebSocket ()
WebSocket.fromUpgradedSocket ( Socket socket , { String ? protocol , bool ? serverSide , CompressionOptions compression = CompressionOptions.compressionDefault } )
Cria um WebSocket de um soquete já atualizado.
fábrica
Propriedades
closeCode → int ?
O código de fechamento definido quando a conexão WebSocket é fechada. Se não houver código de fechamento disponível, esta propriedade seránull
somente leitura
closeMotivo → String ?
O motivo de fechamento definido quando a conexão WebSocket é fechada. Se não houver motivo próximo disponível, esta propriedade seránull
somente leitura
feito → Futuro
Retorna um futuro que é concluído quando o StreamSink é concluído.
somente leitura, herdado
extensões → String
A propriedade extensions é inicialmente a string vazia. Depois que a conexão WebSocket é estabelecida, essa string reflete as extensões usadas pelo servidor.
somente leitura
primeiro → Futuro
O primeiro elemento deste fluxo.
somente leitura, herdado
hashCode → int
O código hash para este objeto.
somente leitura, herdado
isBroadcast → bool
Se este fluxo é um fluxo de transmissão.
somente leitura, herdado
isEmpty → Futuro < bool >
Se este fluxo contém quaisquer elementos.
somente leitura, herdado
último → Futuro
O último elemento deste fluxo.
somente leitura, herdado
comprimento → Futuro < int >
O número de elementos neste fluxo.
somente leitura, herdado
pingInterval ↔ Duração ?
O intervalo entre os sinais de ping.
ler escrever
protocolo → String ?
A propriedade de protocolo é inicialmente a string vazia. Após a conexão WebSocket ser estabelecida, o valor é o subprotocolo selecionado pelo servidor. Se nenhum subprotocolo for negociado o valor permanecerá null.
somente leitura
estadopronto → int
Retorna o estado atual da conexão.
somente leitura
runtimeType → Tipo
Uma representação do tipo de tempo de execução do objeto.
somente leitura, herdado
solteiro → Futuro
O único elemento deste fluxo.
somente leitura, herdado
Métodos
adicionar ( dados dinâmicos ) → void
Envia dados na conexão WebSocket. Os dados datadevem ser um Stringou um List<int>bytes de retenção.
sobrepor
addError ( Erro de objeto , [ StackTrace ? stackTrace ] ) → void
Adiciona um errorà pia.
herdado
addStream ( fluxo de fluxo ) → Futuro
Envia dados de um fluxo na conexão WebSocket. Cada evento de dados de streamserá enviado como um único quadro WebSocket. Os dados de stream devem ser Strings ou List<int>s contendo bytes.
sobrepor
addUtf8Text ( List < int > bytes ) → void
Envia uma mensagem de texto com o texto representado por bytes.
qualquer ( teste bool ( elemento dinâmico ) ) → Futuro < bool >
Verifica se testaceita algum elemento fornecido por este fluxo.
herdado
asBroadcastStream ( { void onListen ( StreamSubscription subscription )?, void onCancel ( StreamSubscription subscription )?} ) → Stream
Retorna um fluxo de várias assinaturas que produz os mesmos eventos que este.
herdado
asyncExpand < E > ( Stream < E > ? convert ( evento dinâmico ) ) → Stream < E >
Transforma cada elemento em uma sequência de eventos assíncronos.
herdado
asyncMap < E > ( FutureOr < E > convert ( evento dinâmico ) ) → Stream < E >
Cria um novo fluxo com cada evento de dados desse fluxo mapeado de forma assíncrona para um novo evento.
herdado
cast < R > ( ) → Fluxo < R >
Adapte este fluxo para ser um arquivo Stream<R>.
herdado
close ( [ int ? code , String ? reason ] ) → Futuro
Fecha a conexão WebSocket. Defina o opcional codee os reason argumentos para enviar informações próximas ao peer remoto. Se eles forem omitidos, o peer verá o código WebSocketStatus.noStatusReceived sem motivo.
sobrepor
contém ( objeto ? agulha ) → Futuro < bool >
Retorna se needleocorre nos elementos fornecidos por este fluxo.
herdado
distinct ( [ bool equals ( dynamic anterior , dynamic next )?] ) → Stream
Ignora eventos de dados se forem iguais ao evento de dados anterior.
herdado
drenar < E > ( [ E? futureValue ] ) → Futuro < E >
Descarta todos os dados neste fluxo, mas sinaliza quando está concluído ou ocorreu um erro.
herdado
elementAt ( int index ) → Futuro
Retorna o valor do indexº evento de dados deste fluxo.
herdado
every ( teste bool ( elemento dinâmico ) ) → Futuro < bool >
Verifica se testaceita todos os elementos fornecidos por este fluxo.
herdado
expand < S > ( Iterable < S > convert ( elemento dinâmico ) ) → Stream < S >
Transforma cada elemento desse fluxo em uma sequência de elementos.
herdado
firstWhere ( bool test ( dynamic element ), { dynamic orElse ()?} ) → Future
Localiza o primeiro elemento deste fluxo correspondente test.
herdado
fold < S > ( S valor inicial , S combina ( S anterior , elemento dinâmico ) ) → Futuro < S >
Combina uma sequência de valores aplicando repetidamente combine.
herdado
forEach ( ação void ( elemento dinâmico ) ) → Futuro
Executa actionem cada elemento deste fluxo.
herdado
handleError ( Function onError , { bool test ( dynamic error )?} ) → Stream
Cria um Stream wrapper que intercepta alguns erros desse stream.
herdado
join ( [ Separador de String = "" ] ) → Futuro < String >
Combina a representação de string de elementos em uma única string.
herdado
lastWhere ( bool test ( dynamic element ), { dynamic orElse ()?} ) → Future
Localiza o último elemento neste fluxo correspondente test.
herdado
listen ( void onData ( dynamic event )?, { Function ? onError , void onDone ()?, bool ? cancelOnError } ) → StreamSubscription
Adiciona uma assinatura a este fluxo.
herdado
map < S > ( S convert ( evento dinâmico ) ) → Stream < S >
Transforma cada elemento deste fluxo em um novo evento de fluxo.
herdado
noSuchMethod ( invocação de invocação ) → dinâmico
Invocado quando um método ou propriedade inexistente é acessado.
herdado
pipe ( StreamConsumer streamConsumer ) → Futuro
Encaminha os eventos deste fluxo para arquivos streamConsumer.
herdado
reduzir ( combinação dinâmica ( anterior dinâmico , elemento dinâmico ) ) → Futuro
Combina uma sequência de valores aplicando repetidamente combine.
herdado
singleWhere ( bool test ( dynamic element ), { dynamic orElse ()?} ) → Future
Localiza o elemento único neste fluxo correspondente test.
herdado
pular ( int count ) → Stream
Ignora os primeiros counteventos de dados deste fluxo.
herdado
skipWhile ( teste bool ( elemento dinâmico ) ) → Stream
Ignore eventos de dados deste fluxo enquanto eles são correspondidos por test.
herdado
take ( int count ) → Stream
Fornece no máximo os primeiros counteventos de dados deste fluxo.
herdado
takeWhile ( teste bool ( elemento dinâmico ) ) → Stream
Encaminha eventos de dados enquanto testé bem-sucedido.
herdado
timeout ( Duração timeLimit , { void onTimeout ( EventSink sink )?} ) → Stream
Cria um novo fluxo com os mesmos eventos deste fluxo.
herdado
toList ( ) → Futuro < Lista >
Coleta todos os elementos deste fluxo em um arquivo List.
herdado
toSet ( ) → Futuro < Definir >
Coleta os dados desse fluxo em um arquivo Set.
herdado
toString ( ) → String
Uma representação de string deste objeto.
herdado
transform < S > ( StreamTransformer < dynamic , S > streamTransformer ) → Stream < S >
Aplica -se streamTransformera este fluxo.
herdado
where ( bool test ( evento dinâmico ) ) → Stream
Cria um novo fluxo a partir desse fluxo que descarta alguns elementos.
herdado
Operadores
operador == ( outro objeto ) → bool
O operador de igualdade.
herdado
Propriedades estáticas
userAgent ↔ String ?
Obtém o agente de usuário usado para conexões WebSocket.
ler escrever
Métodos estáticos
connect ( String url , { Iterable < String > ? protocols , Map < String , dynamic > ? headers , CompressionOptions compressão = CompressionOptions.compressionDefault , HttpClient ? customClient } ) → Futuro < WebSocket >
Crie uma nova conexão WebSocket. A URL fornecida url deve usar o esquema wsou wss.
Constantes
fechado → const int
3
fechando → const int
2
conectando → const int
Possíveis estados da conexão.
0
abrir → const int
1'''
        };
        debugPrint("este arquivo não existe!");
        var resArchive = await file.create(recursive: false);
        debugPrint("archive: $resArchive");

        var jsonData = json.encode(data);
        var bynary = utf8.encode(jsonData);
        resArchive
            .writeAsBytes(bynary)
            .whenComplete(() => debugPrint("file escrita!"));
      }
    } catch (e) {
      debugPrint("erro no createFile: $e");
    }
  }

  void readArchive() async {
    try {
      File file = File("/storage/emulated/0/Manga Libray/manga/backup.json");
      var bin = await file.readAsBytes();
      // print(bin);
      var data = utf8.decode(bin);
      print(data);
    } catch (e) {
      debugPrint("erro no readArchive: $e");
    }
  }
  // ---------------------------------------------------------------------------
  //      ====================== gz file ================================
  // ---------------------------------------------------------------------------

  void createGzFile() async {
    try {
      File file = File("/storage/emulated/0/Manga Libray/manga/backup2.gz");
      if (file.existsSync()) {
        debugPrint("este arquivo existe!");
      } else {
        Map<String, dynamic> data = {
          "tipo": "vertical",
          "exists": true,
          "num": [1, 3, 6],
          "txt": '''classe GZipCodecSegurança nula
O GZipCodec codifica bytes brutos em bytes compactados GZip e decodifica bytes compactados GZip em bytes brutos.

A diferença entre ZLibCodec e GZipCodec é que o GZipCodec envolve os ZLibbytes compactados em GZipquadros.

Herança
Objeto Codec < List < int > , List < int > > GZipCodecName
Construtores
GZipCodec ( { int level = ZLibOption.defaultLevel , int windowBits = ZLibOption.defaultWindowBits , int memLevel = ZLibOption.defaultMemLevel , int strategy = ZLibOption.strategyDefault , List < int > ? dictionary , bool raw = false , bool gzip = true } )
Propriedades
decodificador → ZLibDecoder
Obtenha um ZLibDecoder para decodificar GZipdados compactados.
somente leitura, substituir
dicionário → Lista < int > ?
Dicionário de compressão inicial.
final
codificador → ZLibEncoder
Obtenha um ZLibEncoder para codificação de GZipdados compactados.
somente leitura, substituir
gzip → bool
Quando true, GZipos quadros serão adicionados aos dados compactados.
final
hashCode → int
O código hash para este objeto.
somente leitura, herdado
invertido → Codec < List < int > , List < int > >
Inverte this.
somente leitura, herdado
nível → int
O nível de compactação pode ser definido no intervalo de -1..9, 6sendo o nível de compactação padrão. Os níveis acima 6terão taxas de compactação mais altas ao custo de mais uso de CPU e memória. Os níveis abaixo 6usarão menos CPU e memória ao custo de taxas de compactação mais baixas.
final
memNível → int
Especifica quanta memória deve ser alocada para o estado de compactação interna. 1usa memória mínima, mas é lento e reduz a taxa de compactação; 9usa memória máxima para velocidade ideal. O valor padrão é 8.
final
cru → bool
Quando true, deflate gera dados brutos sem cabeçalho ou trailer zlib e não computará um valor de verificação adler32
final
runtimeType → Tipo
Uma representação do tipo de tempo de execução do objeto.
somente leitura, herdado
estratégia → int
Ajusta o algoritmo de compressão. Use o valor ZLibOption.strategyDefault para dados normais, ZLibOption.strategyFiltered para dados produzidos por um filtro (ou preditor), ZLibOption.strategyHuffmanOnly para forçar apenas a codificação Huffman (sem correspondência de string) ou ZLibOption.strategyRle para limitar as distâncias de correspondência a um (executar -codificação de comprimento).
final
windowBits → int
Baseie dois logaritmos do tamanho da janela (o tamanho do buffer do histórico). Deve estar no intervalo 8..15. Valores maiores resultam em melhor compactação às custas do uso de memória. o valor padrão é15
final
Métodos
decodificar ( Lista < int > codificado ) → Lista < int >
Decodifica encodeddados.
herdado
codificar ( List < int > input ) → List < int >
Codifica input.
herdado
fusível < R > ( Codec < List < int > , R > other ) → Codec < List < int > , R >
Fusíveis thiscom other.
herdado
noSuchMethod ( invocação de invocação ) → dinâmico
Invocado quando um método ou propriedade inexistente é acessado.
herdado
toString ( ) → String
Uma representação de string deste objeto.
herdado
Operadores
operador == ( outro objeto ) → bool
O operador de igualdade.
herdado''',
          "txt2": '''
Um objeto de comunicação HTTP bidirecional para aplicativos cliente ou servidor.

O fluxo expõe as mensagens recebidas. Uma mensagem de texto será do tipo Stringe uma mensagem binária será do tipo List<int>.

Tipos implementados
FluxoStreamSink
Extensões disponíveis
StreamExtensionsStreamSinkExtensions
Construtores
WebSocket ()
WebSocket.fromUpgradedSocket ( Socket socket , { String ? protocol , bool ? serverSide , CompressionOptions compression = CompressionOptions.compressionDefault } )
Cria um WebSocket de um soquete já atualizado.
fábrica
Propriedades
closeCode → int ?
O código de fechamento definido quando a conexão WebSocket é fechada. Se não houver código de fechamento disponível, esta propriedade seránull
somente leitura
closeMotivo → String ?
O motivo de fechamento definido quando a conexão WebSocket é fechada. Se não houver motivo próximo disponível, esta propriedade seránull
somente leitura
feito → Futuro
Retorna um futuro que é concluído quando o StreamSink é concluído.
somente leitura, herdado
extensões → String
A propriedade extensions é inicialmente a string vazia. Depois que a conexão WebSocket é estabelecida, essa string reflete as extensões usadas pelo servidor.
somente leitura
primeiro → Futuro
O primeiro elemento deste fluxo.
somente leitura, herdado
hashCode → int
O código hash para este objeto.
somente leitura, herdado
isBroadcast → bool
Se este fluxo é um fluxo de transmissão.
somente leitura, herdado
isEmpty → Futuro < bool >
Se este fluxo contém quaisquer elementos.
somente leitura, herdado
último → Futuro
O último elemento deste fluxo.
somente leitura, herdado
comprimento → Futuro < int >
O número de elementos neste fluxo.
somente leitura, herdado
pingInterval ↔ Duração ?
O intervalo entre os sinais de ping.
ler escrever
protocolo → String ?
A propriedade de protocolo é inicialmente a string vazia. Após a conexão WebSocket ser estabelecida, o valor é o subprotocolo selecionado pelo servidor. Se nenhum subprotocolo for negociado o valor permanecerá null.
somente leitura
estadopronto → int
Retorna o estado atual da conexão.
somente leitura
runtimeType → Tipo
Uma representação do tipo de tempo de execução do objeto.
somente leitura, herdado
solteiro → Futuro
O único elemento deste fluxo.
somente leitura, herdado
Métodos
adicionar ( dados dinâmicos ) → void
Envia dados na conexão WebSocket. Os dados datadevem ser um Stringou um List<int>bytes de retenção.
sobrepor
addError ( Erro de objeto , [ StackTrace ? stackTrace ] ) → void
Adiciona um errorà pia.
herdado
addStream ( fluxo de fluxo ) → Futuro
Envia dados de um fluxo na conexão WebSocket. Cada evento de dados de streamserá enviado como um único quadro WebSocket. Os dados de stream devem ser Strings ou List<int>s contendo bytes.
sobrepor
addUtf8Text ( List < int > bytes ) → void
Envia uma mensagem de texto com o texto representado por bytes.
qualquer ( teste bool ( elemento dinâmico ) ) → Futuro < bool >
Verifica se testaceita algum elemento fornecido por este fluxo.
herdado
asBroadcastStream ( { void onListen ( StreamSubscription subscription )?, void onCancel ( StreamSubscription subscription )?} ) → Stream
Retorna um fluxo de várias assinaturas que produz os mesmos eventos que este.
herdado
asyncExpand < E > ( Stream < E > ? convert ( evento dinâmico ) ) → Stream < E >
Transforma cada elemento em uma sequência de eventos assíncronos.
herdado
asyncMap < E > ( FutureOr < E > convert ( evento dinâmico ) ) → Stream < E >
Cria um novo fluxo com cada evento de dados desse fluxo mapeado de forma assíncrona para um novo evento.
herdado
cast < R > ( ) → Fluxo < R >
Adapte este fluxo para ser um arquivo Stream<R>.
herdado
close ( [ int ? code , String ? reason ] ) → Futuro
Fecha a conexão WebSocket. Defina o opcional codee os reason argumentos para enviar informações próximas ao peer remoto. Se eles forem omitidos, o peer verá o código WebSocketStatus.noStatusReceived sem motivo.
sobrepor
contém ( objeto ? agulha ) → Futuro < bool >
Retorna se needleocorre nos elementos fornecidos por este fluxo.
herdado
distinct ( [ bool equals ( dynamic anterior , dynamic next )?] ) → Stream
Ignora eventos de dados se forem iguais ao evento de dados anterior.
herdado
drenar < E > ( [ E? futureValue ] ) → Futuro < E >
Descarta todos os dados neste fluxo, mas sinaliza quando está concluído ou ocorreu um erro.
herdado
elementAt ( int index ) → Futuro
Retorna o valor do indexº evento de dados deste fluxo.
herdado
every ( teste bool ( elemento dinâmico ) ) → Futuro < bool >
Verifica se testaceita todos os elementos fornecidos por este fluxo.
herdado
expand < S > ( Iterable < S > convert ( elemento dinâmico ) ) → Stream < S >
Transforma cada elemento desse fluxo em uma sequência de elementos.
herdado
firstWhere ( bool test ( dynamic element ), { dynamic orElse ()?} ) → Future
Localiza o primeiro elemento deste fluxo correspondente test.
herdado
fold < S > ( S valor inicial , S combina ( S anterior , elemento dinâmico ) ) → Futuro < S >
Combina uma sequência de valores aplicando repetidamente combine.
herdado
forEach ( ação void ( elemento dinâmico ) ) → Futuro
Executa actionem cada elemento deste fluxo.
herdado
handleError ( Function onError , { bool test ( dynamic error )?} ) → Stream
Cria um Stream wrapper que intercepta alguns erros desse stream.
herdado
join ( [ Separador de String = "" ] ) → Futuro < String >
Combina a representação de string de elementos em uma única string.
herdado
lastWhere ( bool test ( dynamic element ), { dynamic orElse ()?} ) → Future
Localiza o último elemento neste fluxo correspondente test.
herdado
listen ( void onData ( dynamic event )?, { Function ? onError , void onDone ()?, bool ? cancelOnError } ) → StreamSubscription
Adiciona uma assinatura a este fluxo.
herdado
map < S > ( S convert ( evento dinâmico ) ) → Stream < S >
Transforma cada elemento deste fluxo em um novo evento de fluxo.
herdado
noSuchMethod ( invocação de invocação ) → dinâmico
Invocado quando um método ou propriedade inexistente é acessado.
herdado
pipe ( StreamConsumer streamConsumer ) → Futuro
Encaminha os eventos deste fluxo para arquivos streamConsumer.
herdado
reduzir ( combinação dinâmica ( anterior dinâmico , elemento dinâmico ) ) → Futuro
Combina uma sequência de valores aplicando repetidamente combine.
herdado
singleWhere ( bool test ( dynamic element ), { dynamic orElse ()?} ) → Future
Localiza o elemento único neste fluxo correspondente test.
herdado
pular ( int count ) → Stream
Ignora os primeiros counteventos de dados deste fluxo.
herdado
skipWhile ( teste bool ( elemento dinâmico ) ) → Stream
Ignore eventos de dados deste fluxo enquanto eles são correspondidos por test.
herdado
take ( int count ) → Stream
Fornece no máximo os primeiros counteventos de dados deste fluxo.
herdado
takeWhile ( teste bool ( elemento dinâmico ) ) → Stream
Encaminha eventos de dados enquanto testé bem-sucedido.
herdado
timeout ( Duração timeLimit , { void onTimeout ( EventSink sink )?} ) → Stream
Cria um novo fluxo com os mesmos eventos deste fluxo.
herdado
toList ( ) → Futuro < Lista >
Coleta todos os elementos deste fluxo em um arquivo List.
herdado
toSet ( ) → Futuro < Definir >
Coleta os dados desse fluxo em um arquivo Set.
herdado
toString ( ) → String
Uma representação de string deste objeto.
herdado
transform < S > ( StreamTransformer < dynamic , S > streamTransformer ) → Stream < S >
Aplica -se streamTransformera este fluxo.
herdado
where ( bool test ( evento dinâmico ) ) → Stream
Cria um novo fluxo a partir desse fluxo que descarta alguns elementos.
herdado
Operadores
operador == ( outro objeto ) → bool
O operador de igualdade.
herdado
Propriedades estáticas
userAgent ↔ String ?
Obtém o agente de usuário usado para conexões WebSocket.
ler escrever
Métodos estáticos
connect ( String url , { Iterable < String > ? protocols , Map < String , dynamic > ? headers , CompressionOptions compressão = CompressionOptions.compressionDefault , HttpClient ? customClient } ) → Futuro < WebSocket >
Crie uma nova conexão WebSocket. A URL fornecida url deve usar o esquema wsou wss.
Constantes
fechado → const int
3
fechando → const int
2
conectando → const int
Possíveis estados da conexão.
0
abrir → const int
1'''
        };
        debugPrint("este arquivo não existe!");
        var resArchive = await file.create(recursive: false);
        // debugPrint("archive: $resArchive");

        var jsonData = json.encode(data);
        var bytes = utf8.encode(jsonData);
        var gzBytes = GZipCodec(dictionary: bytes);
        // gzBytes.encoder;
        var decode = gzBytes.encoder;
        resArchive
            .writeAsBytes(decode.convert(bytes))
            .whenComplete(() => debugPrint("file escrita!"));
      }
    } catch (e) {
      debugPrint("erro no createGZFile: $e");
    }
  }

  void readGzArchive([File? file]) async {
    try {
      file ??= File("/storage/emulated/0/Manga Libray/manga/backup2.gz");

      var bin = await file.readAsBytes();
      // print(bin);
      var decode = GZipCodec(dictionary: bin);
      var bytes = decode.decoder;
      var data = utf8.decode(bytes.convert(bin));
      print(data);
    } catch (e) {
      debugPrint("erro no readGzArchive: $e");
    }
  }

  // procurar um arquivo no sistema e le-lo
  void readArchiveSearch() async {
    try {
      final data = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: ['gz']);
      if (data == null) {
        debugPrint("não selecionou um arquivo!");
      } else {
        final path = data.files.single.path!.replaceFirst("Android/data/com.example.background_test/files/", "");
        log("arquive - path: $path");
        File file = File(path);
        readGzArchive(file);
      }
      // debugPrint("cache : ");
    } catch (e) {
      debugPrint("falha at readArchive System: $e");
    }
  }

  void getDirectory() async {
    try {
      final data = await FilePicker.platform.getDirectoryPath();
      if (data == null) {
        log("não foi selecionado uma file!");
      } else {
        log("path: $data");
      }
    } catch (e) {
      debugPrint("erro no getDirectory: $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () => createFileBackup(),
              child: const Text("create file"),
            ),
            TextButton(
              onPressed: () => createDirectory(),
              child: const Text("create dir"),
            ),
            TextButton(
              onPressed: () => readArchive(),
              child: const Text("read archive"),
            ),
            TextButton(
              onPressed: () => deleteDirectory(),
              child: const Text("delete dir"),
            ),
            TextButton(
              onPressed: () => createGzFile(),
              child: const Text("create GZ"),
            ),
            TextButton(
              onPressed: () => readGzArchive(),
              child: const Text("read GZ"),
            ),
            TextButton(
              onPressed: () => getDirectory(),
              child: const Text("get directory"),
            ),
            TextButton(
              onPressed: () => readArchiveSearch(),
              child: const Text("input read archive .GZ"),
            ),
          ],
        )),
      ),
    );
  }
}
