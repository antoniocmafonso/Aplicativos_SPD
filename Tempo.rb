'''Estatísticas de Simulação - Cálculo de tempo médio de espera, tempo médio no
sistema e taxa de ocupação do servidor.'''

  class FilaDeAtendimento
    def initialize
      @fila = []
      @total_clientes = 0
      @total_tempo_espera = 0
      @total_tempo_atendimento = 0
      @tempo_inicial = Time.now
    end
  
    def adicionar_pessoa(nome)
      senha = gerar_senha_aleatoria
      @fila << { nome: nome, senha: senha, chegada: Time.now }
      @total_clientes += 1
      puts "#{nome} recebeu a senha #{senha} e foi adicionado(a) à fila."
    end
  
    def chamar_proxima_pessoa
      if @fila.empty?
        puts "Não há ninguém na fila."
      else
        pessoa = @fila.shift
        tempo_espera = Time.now - pessoa[:chegada]
        tempo_atendimento = rand(5..15) # Tempo aleatório de atendimento entre 5 e 15 segundos
        @total_tempo_espera += tempo_espera
        @total_tempo_atendimento += tempo_atendimento
        puts "#{pessoa[:nome]} com a senha #{pessoa[:senha]} está sendo atendido(a) agora."
        sleep(tempo_atendimento)
      end
    end
  
    def exibir_fila
      if @fila.empty?
        puts "A fila está vazia."
      else
        fila_atual = @fila.map { |pessoa| "#{pessoa[:nome]} (senha #{pessoa[:senha]})" }.join(', ')
        puts "Fila de atendimento: #{fila_atual}"
      end
    end
  
    def exibir_estatisticas
      if @total_clientes == 0
        puts "Nenhuma estatística disponível - nenhum cliente atendido."
        return
      end
  
      tempo_medio_espera = @total_tempo_espera / @total_clientes
      tempo_medio_atendimento = @total_tempo_atendimento / @total_clientes
      tempo_total_simulacao = Time.now - @tempo_inicial
      taxa_ocupacao = @total_tempo_atendimento / tempo_total_simulacao
  
      puts "Estatísticas da Simulação:"
      puts "Tempo médio de espera: #{tempo_medio_espera.round(2)} segundos"
      puts "Tempo médio no sistema: #{(tempo_medio_espera + tempo_medio_atendimento).round(2)} segundos"
      puts "Taxa de ocupação do servidor: #{(taxa_ocupacao * 100).round(2)}%"
    end
  
    private
  
    def gerar_senha_aleatoria
      "A%03d" % rand(1..999)
    end
  end
  
  # Simulação da fila de atendimento
  fila = FilaDeAtendimento.new
  
  loop do
    puts "\nEscolha uma opção:"
    puts "1. Adicionar pessoa à fila"
    puts "2. Chamar próxima pessoa"
    puts "3. Exibir fila"
    puts "4. Exibir estatísticas"
    puts "5. Sair"
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
      fila.exibir_estatisticas
    when 5
      puts "Encerrando o programa..."
      break
    else
      puts "Opção inválida. Tente novamente."
    end
  end
  