import 'package:flutter/material.dart';

import 'Model/ChipData.dart';
import 'chip.dart';

class ListDataBottom extends StatefulWidget {
  const ListDataBottom({Key? key}) : super(key: key);

  @override
  State<ListDataBottom> createState() => _ListDataBottomState();
}

class _ListDataBottomState extends State<ListDataBottom> {
  double _currentSliderValue = 20;
  int _valueButton = 1;

  List<bool> _selectConvenient = List.generate(6, (_) => false);

  List<ChipData> chips = Chips.all;
  final double spacing = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Bộ lọc',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Theo mức giá',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$_currentSliderValue đ',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlue,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        Slider(
          value: _currentSliderValue,
          max: 100,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: const Text('0 VNĐ'),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: const Text('60.000.000 VNĐ'),
            )
          ],
        ),
        Container(
          height: 20,
          color: Colors.black12,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text(
            'Hạng sao',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            height: 2,
            color: Colors.black12,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: _valueButton,
                        onChanged: (value) {
                          setState(() {
                            _valueButton = 1;
                          });
                        }),
                    const Text("1 sao")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: _valueButton,
                        onChanged: (value) {
                          setState(() {
                            _valueButton = 2;
                          });
                        }),
                    const Text("2 sao")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 3,
                        groupValue: _valueButton,
                        onChanged: (value) {
                          setState(() {
                            _valueButton = 3;
                          });
                        }),
                    const Text("3 sao")
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        value: 4,
                        groupValue: _valueButton,
                        onChanged: (value) {
                          setState(() {
                            _valueButton = 4;
                          });
                        }),
                    const Text("4 sao")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 5,
                        groupValue: _valueButton,
                        onChanged: (value) {
                          setState(() {
                            _valueButton = 5;
                          });
                        }),
                    const Text("5 sao")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 6,
                        groupValue: _valueButton,
                        onChanged: (value) {
                          setState(() {
                            _valueButton = 6;
                          });
                        }),
                    const Text("Không xếp hạng")
                  ],
                ),
              ],
            )
          ],
        ),
        Container(
          height: 20,
          color: Colors.black12,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text(
            'Tiện nghi',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 2,
            color: Colors.black12,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: buildChips(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Thiết lập lại',
                      style: TextStyle(color: Colors.black45)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white10),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(15),
                ),
                Expanded(
                    child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Hiển thị kết quả',
                      style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlueAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
                  ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildChips() => Wrap(
      runSpacing: spacing,
      spacing: spacing,
      children: chips
          .map((chip) => Chip(
                padding: EdgeInsets.only(left: 10, right: 10),
                labelPadding: EdgeInsets.all(4),
                label: Text(
                  chip.label,
                  style: TextStyle(color: Colors.black87),
                ),
                backgroundColor: Colors.black12,
              ))
          .toList());
}
