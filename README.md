# Campeões da Copa do Mundo
## Análise de Agrupamentos (Clusters)



<div class="conteudo" style="border-box: none">
<p align="justify">
    Utilizando o trabalho de "Libertadores 2022 - Fase de Grupos" como inspiração, foi analisado o desempenho das seleções campeãs da Copa do Mundo.
Foi utilizado o método hierárquico de agrupamento, onde não é necessário saber o número de grupos. As variáveis utilizadas neste trabalho foram: Pontos Conquistados, Aproveitamento, Gols Feitos, Gols Sofridos, Apoio (Média de Público) e Fator Casa (se o campeão foi mandante).
</p> 

### Análise de Correlação

<div class="conteudo" style="border-box: none">
<p align="justify">
    Inicialmente, foi analisado a correlação entre as variáveis selecionadas. De cara, observa-se que há uma correlação positiva forte entre Gols Feitos e Gols Sofridos, isto é, Seleções que fazem muitos gols, sofrem muitos gols (Seleções com um jogo mais ofensivo). Seleções com maior Apoio do Público conquistam mais pontos (vencem mais).<br><br>
    Seleções da Casa possuem desempenho ofensivo menor e sofrem poucos gols. Por consequência (e obviedade), Seleções da Casa possuem maior Apoio do Público. Apoio do Público tem uma correlação positiva fraca com Gols Feitos, ou seja, quanto mais Gols Feitos, melhor o Aproveitamento.
</p> 

<div align="center">
<img src="https://user-images.githubusercontent.com/61093881/171075398-c9b4470c-14d1-4b73-941e-51151b5e7346.png" width="600px" />
</div>
    
### Observa-se 4 grupos com algumas particularidades:
<p align="justify">
Grupo 1: Times com melhor desempenho na Libertadores.<br><br>
Grupo 2 e 3: Times que ocuparam a última colocação na fase de grupos. A diferença entre o grupo 2 e 3, mesmo com a característica de ocuparem a última colocação, é que o grupo 2 é formado pelas duas equipes com pior desempenho na fase de grupos.<br><br>
Grupo 4: Demais times na competição (Poderia analisar algum particularidades nesse grupo, mas cabe a outro estudo).<br><br>
</p>
<div>
    
<div align="center">
<img src="https://user-images.githubusercontent.com/61093881/171075398-c9b4470c-14d1-4b73-941e-51151b5e7346.png" width="600px" />
</div>
