import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Painel de Tarefas',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      home: const PainelTarefasPage(),
    );
  }
}

class PainelTarefasPage extends StatelessWidget {
  const PainelTarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Tarefas', style: text.titleLarge),
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        centerTitle: true,
      ),
      body: const Padding(
        // token de espaçamento 16 dp
        padding: EdgeInsets.all(16),

        child: TarefasLista(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Filtrar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: () {},
                child: const Text('Nova Tarefa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TarefasLista extends StatelessWidget {
  const TarefasLista({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    final tarefas = [
      ('Estudar Flutter', 'Revisar widgets e estado.'),
      ('Criar Design System', 'Definir cores, tipografia e espaçamentos.'),
      ('Testar Material 3', 'Aplicar tema em componentes.'),
    ];

    return ListView.separated(
      itemCount: tarefas.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12), // token 12 dp
      itemBuilder: (context, index) {
        final (titulo, descricao) = tarefas[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16), // token 16 dp
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: text.titleMedium),
                const SizedBox(height: 8),
                Text(descricao, style: text.bodyMedium),
              ],
            ),
          ),
        );
      },
    );
  }
}
