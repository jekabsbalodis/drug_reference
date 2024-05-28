import 'package:drug_reference/widgets/search_mode_button.dart';
import 'package:flutter/material.dart';

class MedicationSearch extends StatefulWidget {
  const MedicationSearch({
    super.key,
    required this.onEnterSearchTerm,
  });

  final void Function(String searchTerm, SearchMode searchMode)
      onEnterSearchTerm;

  @override
  State<MedicationSearch> createState() => _MedicationSearchState();
}

class _MedicationSearchState extends State<MedicationSearch> {
  final _searchTermController = TextEditingController();
  SearchMode _selectedSearchMode = SearchMode.activeSubstance;

  void _setSearchMode(SearchMode mode) {
    _selectedSearchMode = mode;
  }

  void _submitSearchTerm() {
    widget.onEnterSearchTerm(
      _searchTermController.text,
      _selectedSearchMode,
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _searchTermController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
        child: Column(
          children: [
            SearchModeButton(
              onSetSearchMode: _setSearchMode,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchTermController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        label: Text('Meklēt medikamentu')),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                    onSubmitted: (value) {
                      _submitSearchTerm();
                    },
                    autofocus: true,
                  ),
                ),
                FilledButton(
                    onPressed: _submitSearchTerm, child: const Text('Meklēt'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
