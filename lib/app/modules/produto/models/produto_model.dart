class ProdutoModel{
  final int id;
  final int lojaId;
  final String nome;
  final String descricao;
  final String preco;
  final String imagem;

  ProdutoModel({this.lojaId, this.id, this.nome, this.descricao, this.preco, this.imagem});
}