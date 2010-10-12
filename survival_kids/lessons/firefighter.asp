<!--#include virtual="/include/templates/sk_top.asa"-->
<!--#include file="sk_functions.asa"-->
<form name="sk" action="grade_lesson.asp" method="post">
<input type="hidden" name="TotalQuestions" value="10">
<input type="hidden" name="Submit">

<table>
	<tr>
		<td class="SKIntro">If you can answer <b>8 out of 10 
		questions correctly</b>, you will be promoted to ENGINEER. Choose the best answer. 
		</td>
	</tr>
	<tr>
		<td class="SKIntro"><b>GOOD LUCK FIREFIGHTER!</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="SKIntro"><b>Lesson 3</b>&nbsp;&nbsp;&nbsp;<span class="SKLesson">PERSONAL SAFETY &amp; STRANGERS</span></td>
	</tr>
	<tr>
		<td class="SKQuestion">1. Adults can steal kids?
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio1" value="true"></td>
					<td class="SKAnswer">True
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio1" value="false"></td>
					<td class="SKAnswer">False
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">2. As a kid, I should always tell my parents where I am going and when I'll be home.
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio2" value="true"></td>
					<td class="SKAnswer">True
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio2" value="false"></td>
					<td class="SKAnswer">False
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">3. I don't need to let my parents know whose house I am at; they can call around and find me.
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio3" value="false"></td>
					<td class="SKAnswer">True
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio3" value="true"></td>
					<td class="SKAnswer">False
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">4. If I come home from school before my parents get home, I should;
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio4" value="false"></td>
					<td class="SKAnswer">Lock doors once I am inside
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio4" value="false"></td>
					<td class="SKAnswer">Don't answer the door if someone knocks or rings the doorbell
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio4" value="false"></td>
					<td class="SKAnswer">Don't answer the telephone, use the caller-ID or answering machine instead
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio4" value="true"></td>
					<td class="SKAnswer">All of the above
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">5. If I got lost in the Mall, I could go to whom for help?
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio5" value="false"></td>
					<td class="SKAnswer">Mothers with children
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio5" value="false"></td>
					<td class="SKAnswer">Police in uniform 
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio5" value="false"></td>
					<td class="SKAnswer">Store clerks in the mall
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio5" value="true"></td>
					<td class="SKAnswer">All of the above 
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">6. My parents should help me be safe by:
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio6" value="false"></td>
					<td class="SKAnswer">Making sure they know where I am playing or staying
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio6" value="false"></td>
					<td class="SKAnswer">Knowing who my friends are
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio6" value="false"></td>
					<td class="SKAnswer">Calling to make sure I got home from school okay
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio6" value="true"></td>
					<td class="SKAnswer">All of the above
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">7. If I am working on the computer and someone wants to &quot;chat&quot; with me, I should:
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio7" value="false"></td>
					<td class="SKAnswer">Ignore them
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio7" value="false"></td>
					<td class="SKAnswer">Log off
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio7" value="false"></td>
					<td class="SKAnswer">Ask my parents for permission
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio7" value="true"></td>
					<td class="SKAnswer">Only chat with my friends
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">8. If I am out by myself or with a friend and someone tries to take me, I should:
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio8" value="true"></td>
					<td class="SKAnswer">Kick and scream and attract attention
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio8" value="false"></td>
					<td class="SKAnswer">Go with them
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio8" value="false"></td>
					<td class="SKAnswer">Call my parents for permission
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio8" value="false"></td>
					<td class="SKAnswer">None of the above
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">9. If my babysitter does something against our family rules, I should
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio9" value="true"></td>
					<td class="SKAnswer">Tell my Mom and Dad when they get home
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio9" value="true"></td>
					<td class="SKAnswer">Call my Mom and Dad wherever they are before they get home
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio9" value="false"></td>
					<td class="SKAnswer">Tell my babysitter that she is doing something wrong
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio9" value="false"></td>
					<td class="SKAnswer">Go to bed and forget about it
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SKQuestion">10. If I am home alone and need help, I should
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td><input type="radio" id="radio1" name="radio10" value="true"></td>
					<td class="SKAnswer">Call my Mom or Dad
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio10" value="true"></td>
					<td class="SKAnswer">Call 9-1-1
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio10" value="false"></td>
					<td class="SKAnswer">Call a friend
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="radio1" name="radio10" value="false"></td>
					<td class="SKAnswer">Handle the emergency myself
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td align="center"><a href="javascript:SubmitForm('Submit');"><img SRC="/images/buttons/SK_Submit.gif" border="0"></a></td>
	</tr>
</table>
</form>
<!--#include virtual="/include/templates/sk_bottom.asa"-->
