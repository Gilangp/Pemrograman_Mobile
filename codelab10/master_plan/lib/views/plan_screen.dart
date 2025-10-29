import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    if (!plansNotifier.value.any((p) => p.name == plan.name)) {
      plansNotifier.value = List<Plan>.from(plansNotifier.value)..add(plan);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name),
        backgroundColor: Colors.purple,
      ),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan =
              plans.firstWhere((p) => p.name == plan.name, orElse: () => plan);

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      child: const Icon(Icons.add, color: Colors.white),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());

        if (planIndex == -1) {
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..add(Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            ));
        } else if (planIndex < planNotifier.value.length) {
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan, plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Plan currentPlan, Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        activeColor: Colors.purple,
        onChanged: (selected) {
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
          if (planIndex == -1 || planIndex >= planNotifier.value.length) return;

          List<Task> updatedTasks = List<Task>.from(currentPlan.tasks);
          if (index < 0 || index >= updatedTasks.length) return;

          updatedTasks[index] = Task(
            description: task.description,
            complete: selected ?? false,
          );

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        cursorColor: Colors.purple,
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
        onChanged: (text) {
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
          if (planIndex == -1 || planIndex >= planNotifier.value.length) return;

          List<Task> updatedTasks = List<Task>.from(currentPlan.tasks);
          if (index < 0 || index >= updatedTasks.length) return;

          updatedTasks[index] = Task(
            description: text,
            complete: task.complete,
          );

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
        },
      ),
    );
  }
}
