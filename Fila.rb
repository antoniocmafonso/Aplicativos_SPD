'''Simulação de Fila - Implementação de uma simulação básica de fila de
atendimento, como em um banco ou supermercado'''

class FilaDeAtendimento
  def initialize
    @fila = []
  end

  def adicionar_pessoa(nome)
    @fila << nome
    puts "#{nome} foi adicionado(a) à fila."
  end

  def chamar_proxima_pessoa
    if @fila.empty?
      puts "Não há ninguém na fila."
    else
      pessoa = @fila.shift
      puts "#{pessoa} está sendo atendido(a) agora."
    end
  end

  def exibir_fila
    if @fila.empty?
      puts "A fila está vazia."
    else
      puts "Fila de atendimento: #{@fila.join(', ')}"
    end
  end
end

# Simulação da fila de atendimento
fila = FilaDeAtendimento.new

loop do
  puts "\nEscolha uma opção:"
  puts "1. Adicionar pessoa à fila"
  puts "2. Chamar próxima pessoa"
  puts "3. Exibir fila"
  puts "4. Sair"
  print "Opção: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    print "Digite o nome da pessoa: "
    nome = gets.chomp
    fila.adicionar_pessoa(nome)
  when 2
    fila.chamar_proxima_pessoa
  when 3
    fila.exibir_fila
  when 4
    puts "Encerrando o programa..."
    break
  else
    puts "Opção inválida. Tente novamente."
  end
end
