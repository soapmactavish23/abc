import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';
import 'package:radar_peconhento_mobile/views/base/components/drawer_custom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerCustom(),
      appBar: AppBar(
        title: const Text('Animais Peçonhentos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  ImagesConstants.imageLogo,
                  width: 200,
                ),
              ),
              const Divider(),
              const Text(
                'Bem-vindo ao Sistema de Identificação de Animais Peçonhentos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text(
                'Desenvolvido inicialmente como um manual, este projeto foi transformado em um avançado Sistema de Informação como parte da dissertação de mestrado de Henrick de Sousa Nogueira, no Programa de Pós-Graduação em Computação Aplicada da Universidade Federal do Pará (UFPA). O sistema integra tecnologias de ponta em Banco de Dados Relacional com MySQL, programação Back-End em Java utilizando Spring Boot e REST API, além de inovações em Visão Computacional e Deep Learning com Python, TensorFlow, OpenCV e Keras. Complementarmente, a interface do usuário é desenvolvida em Vue.js para a web e Flutter para aplicativos móveis, disponíveis tanto para Android quanto para iOS.',
              ),
              const Divider(),
              const Text(
                  'A funcionalidade principal do sistema é a informatização do conteúdo do antigo manual para facilitar a identificação de animais peçonhentos. Uma característica destacada é a capacidade de os usuários enviarem fotos de animais via aplicativo móvel para o servidor. Lá, a imagem é processada por um script Python que utiliza um modelo de rede neural convolucional treinado para reconhecer o animal. Após o reconhecimento, o sistema fornece informações detalhadas sobre o animal identificado, incluindo o nível de gravidade do acidente, possíveis sintomas, exames laboratoriais recomendados e tratamentos apropriados.'),
              const Divider(),
              const Text(
                  'Este sistema não apenas moderniza a identificação de animais peçonhentos, mas também contribui significativamente para a segurança e educação ambiental na região amazônica.'),
              const Divider(),
              const Text(
                  'A disposição geográfica do Estado do Pará, seu clima "tropical" (quente e úmido), está enquadrada na formação de "floresta tropical pluvial", formada por mata de terra firme e mata de várzea, favorecendo a proliferação e manutenção de espécies, formando uma das mais complexas biodiversidades do planeta.'),
              const Divider(),
              const Text(
                  'O ser humano na região convive constantemente com espécies naturais em seu habitat, o que pode ser nocivo a sua saúde.'),
              const Divider(),
              const Text(
                  'Os acidentes por animais peçonhentos são considerados um problema de saúde pública no Brasil, em virtude do elevado número de pessoas envolvidas anualmente, pela gravidade e complicações que podem apresentar.'),
              const Divider(),
              const Text(
                  'Em decorrência das dimensões territoriais da Amazônia e ausência de profissionais de saúde em diversos municípios, os primeiros socorros muitas vezes são realizados por pessoas não habilitadas que praticam um verdadeiro festival folclórico no atendimento às vitimas.'),
              const Divider(),
              const Text(
                  'Objetivando tornar mais prático o manejo do acidentado por animais peçonhentos, por parte dos profissionais de saúde, este manual de rotinas não pretende substituir as orientações dos Manuais do Ministério da Saúde, nem esgotar os assuntos abordados. ')
            ],
          ),
        ),
      ),
    );
  }
}
