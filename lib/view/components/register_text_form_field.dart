import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheetahTextFormField extends StatelessWidget {


  Widget? prefixIconC;
  Widget? prefixC;
  Widget? rightPrefix;
  String? hintTextC;
  String? labelTextC;
  TextInputType? keyboardType;
  bool? isRightPrefix = false;
  bool? obscureText;

  CheetahTextFormField({Key? key,
    this.isRightPrefix,
    this.labelTextC,
    this.hintTextC,
    this.prefixIconC,
    this.keyboardType,
    this.obscureText,
    this.prefixC
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    ComponentState componentState = Provider.of<ComponentState>(context, listen:true);

    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
        TextFormField(
          keyboardType:keyboardType,
          textAlignVertical: TextAlignVertical.center,
          obscureText: (isRightPrefix != null && isRightPrefix==true) ? componentState.obscureText : false,
          style: const TextStyle(
            height: 2,
            color: Color(0xffE1E4EE),
          ),
          decoration: InputDecoration(
            labelText: labelTextC,
            labelStyle: const TextStyle(
              color: Color(0xff686A70),
            ),
            floatingLabelStyle: const TextStyle(fontSize: 24),
            prefixIcon: prefixIconC,
            hintText: hintTextC,
            hintStyle: const TextStyle(
              fontSize: 16.0,
              color: Color(0xff686A70),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff181920)),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            filled: true,
            fillColor: const Color(0xff252A34),
          ),
        ),

        if (isRightPrefix != null && isRightPrefix==true) ...[
          Positioned(
            child: GestureDetector(
                child:  Icon(Icons.remove_red_eye, color: componentState.obscureIconColor,),
              onTap: (){
                  componentState.obscureToggle();
              },
            ),
            right: 20,
          )
        ],
      ]),
    );
  }
}
