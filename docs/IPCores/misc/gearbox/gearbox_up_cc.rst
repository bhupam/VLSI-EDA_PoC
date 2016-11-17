.. |gh-src| image:: /_static/logos/GitHub-Mark-32px.png
            :scale: 40
            :target: https://github.com/VLSI-EDA/PoC/blob/master/src/misc/gearbox/gearbox_up_cc.vhdl
            :alt: Source Code on GitHub
.. |gh-tb| image:: /_static/logos/GitHub-Mark-32px.png
            :scale: 40
            :target: https://github.com/VLSI-EDA/PoC/blob/master/tb/misc/gearbox/gearbox_up_cc_tb.vhdl
            :alt: Source Code on GitHub

.. sidebar:: GitHub Links

   * |gh-src| :pocsrc:`Sourcecode <misc/gearbox/gearbox_up_cc.vhdl>`
   * |gh-tb| :poctb:`Testbench <misc/gearbox/gearbox_up_cc_tb.vhdl>`

.. _IP:gearbox_up_cc:

gearbox_up_cc
#############

	This module provides a downscaling gearbox with a common clock (cc)
	interface. It perfoems a 'byte' to 'word' collection. The default order is
	LITTLE_ENDIAN (starting at byte(0)). Input "In_Data" and output "Out_Data"
	are of the same clock domain "Clock". Optional input and output registers
	can be added by enabling (ADD_***PUT_REGISTERS = TRUE).



.. rubric:: Entity Declaration:

.. literalinclude:: ../../../../src/misc/gearbox/gearbox_up_cc.vhdl
   :language: vhdl
   :tab-width: 2
   :linenos:
   :lines: 46-69

Source file: :pocsrc:`misc/gearbox/gearbox_up_cc.vhdl <misc/gearbox/gearbox_up_cc.vhdl>`

