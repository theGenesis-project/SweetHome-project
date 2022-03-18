package com.thegenesis.sweethome.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Cert {
	private String who;
	private int certNum;
	private String certDate;
}
